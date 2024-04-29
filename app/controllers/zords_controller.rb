class ZordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_vendor, only: [:new, :create, :edit, :update, :destroy, :new_limited]

  def index
    if current_user && current_user.vendor?
      @q = Zord.ransack(params[:q] || {})
    else
      @q = Zord.where(limited: false).ransack(params[:q] || {})
    end
    # Check if avg_rating is passed as a parameter
  if params[:q] && params[:q][:avg_rating].present?
    @avg_rating_value = params[:q][:avg_rating]
    # Do something with avg_rating_value if needed
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
