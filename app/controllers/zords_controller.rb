class ZordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_vendor, only: [:new, :create, :edit, :update, :destroy, :new_limited]

  def index
    if current_user && current_user.vendor?
      @q = Zord.ransack(params[:q] || {})
    else
      @q = Zord.where(limited: false).ransack(params[:q] || {})
    end

    @zords = @q.result(distinct: true)
    @zords = params[:q] && params[:q][:s].present? ? @zords.order(params[:q][:s]) : @zords.order(:id)
    render :index
  end

  def show
    @zord = Zord.find(params[:id])
    @reviews = @zord.reviews
    total_rating = @reviews.sum(:rating)
    @average_rating = total_rating.to_f / @reviews.length
    @zord.avg_rating = params[:average_rating].present? ? params[:average_rating] : @average_rating
  end


  def new
    if current_user.vendor?
      @zord = Zord.new
      render :new
    else
      redirect_to zords_path, alert: "Only vendors can add new zords."
    end
  end

  def new_limited
    if current_user.vendor?
      @zord = Zord.new
      render :new_limited
    else
      redirect_to zords_path, alert: "Only vendors can add new zords."
    end
  end

  def create
    if current_user.vendor?
      @zord = Zord.new(params.require(:zord).permit(:name, :description,:limited, :material, :price, :figure_image, :ability, :capacity, :quantity, :theme))

      if @zord.save

        if @zord.limited
          flash[:success] = 'Hurray Limited edition Zord was successfully added!'
          redirect_to new_bid_path(zord_id: @zord.id)
        else
          flash[:success] = 'Hurray Zord was successfully added!'
          redirect_to zords_url
        end
      else
        flash.now[:error] = 'Oops Zord creation failed'
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to zords_path, alert: "Only vendors can add new zords."
    end
  end

  def edit
    @zord = Zord.find(params[:id])
    render :edit
  end

  def update
    @zord = Zord.find(params[:id])
    if @zord.update(params.require(:zord).permit(:name, :description, :price, :material, :figure_image, :ability, :capacity, :quantity, :theme))
      flash[:success] = 'Zord was successfully updated!'
      redirect_to zord_url(@zord)
    else
      flash.now[:error] = 'Oops! Zord update failed.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @zord = Zord.find(params[:id])
    bids = Bid.where(zord_id: @zord.id).pluck(:id)
    UserRegistration.where(bid_id: bids).delete_all if bids.any?
    Bid.where(id: bids).delete_all if bids.any?
    order_items = OrderItem.where(zord_id: @zord.id).pluck(:id)
    Review.where(order_item_id: order_items).delete_all if order_items.any?
    OrderItem.where(id: order_items).delete_all if order_items.any?
    resale = Resale.where(zord_id: @zord.id)
    resale.delete_all if resale.any?
    notification = Notification.where(zord_id: @zord.id)
    notification.delete_all if notification.any?
    cart_items = CartItem.where(zord_id: @zord.id)
    cart_items.delete_all if cart_items.any?
    @zord.destroy
    flash[:success] = 'Zord was successfully deleted!'
    redirect_to zords_url
  end

  def require_vendor
    unless current_user.vendor?
      redirect_to zords_path, alert: "Only vendors can manage zords."
    end
  end


end
