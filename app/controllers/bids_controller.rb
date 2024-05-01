class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_vendor, only:[:add_bid, :create_bid, :destroy]

  def index
    @bids = Bid.all
    registered = UserRegistration.distinct.select(:bid_id,:user_id).where(user_id:current_user.id).pluck(:bid_id)
    @bids_registered = Bid.where(id: registered)
    @bids_not_registered =  Bid.where.not(id: registered)
    render :index_bids
  end

  def add_bid
    @zord = Zord.find(params[:zord_id])
    render :new_bid
  end

  def create_bid
    @zord = Zord.find(params[:zord_id])
    @bid = Bid.new(zord: @zord,start_date: params[:start_date], end_date: params[:end_date],base_price: params[:base_price])
    @bid.base_price = @zord.price

    @count = Bid.where(zord_id: @zord.id).count
    if @count > 0
      flash[:error] = 'Bid already exists for this Zord'
      redirect_to all_bids_path
    else
      if @bid.save
        flash[:success] = "Hurray Bid for #{@zord.name} was successfully added!"
        redirect_to all_bids_path
      else
        flash[:error] = ' Check if start date and end date are given'
        redirect_to :new_bid
      end
    end
  end

  def create_registration
    @bid = Bid.find(params[:bid_id])
    @registration = UserRegistration.new(bid: @bid, user: current_user)
    if @registration.save
      flash[:success] = "You have successfully registered for #{@bid.zord.name} bidding"
      redirect_to all_bids_path
    else
      flash[:error] = 'You cannot register for this bid'
      redirect_to :show_zord_bid
    end
  end

  def show_zord_bid
    @bid = Bid.find(params[:bid_id]  )
    @user_registrations = UserRegistration.where(bid: @bid).order(bid_value: :desc)
    render :show_zord_bid
  end

  def destroy_registration
    @bid = Bid.find(params[:bid_id])
    @registration = UserRegistration.find_by(user:current_user,bid:@bid)
    @registration.destroy
    flash[:success] = "Successfully Unregistered from the Bid"
    redirect_to all_bids_path
  end

  def destroy
    @bid = Bid.find(params[:bid_id])
    @zord = Zord.find(@bid.zord_id)
    bids = Bid.where(zord_id: @zord.id).pluck(:id)
    UserRegistration.where(bid_id: bids).delete_all if bids.any?
    Bid.where(id: bids).delete_all if bids.any?
    order_items = OrderItem.where(zord_id: @zord.id).pluck(:id)
    Review.where(order_item_id: order_items).delete_all if order_items.any?
    OrderItem.where(id: order_items).delete_all if order_items.any?
    resale = Resale.where(zord_id: @zord.id)
    resale.delete_all if resale.any?
    notification = notification.where(zord_id: @zord.id)
    notification.delete_all if notification.any?
    cart_items = CartItem.where(zord_id: @zord.id)
    cart_items.delete_all if cart_items.any?
    @zord.destroy
    flash[:success] = "Bid Successfully deleted along with Zord"
    redirect_to all_bids_path
  end

  def add_user_bid
    @bid = Bid.find(params[:bid_id])
    @currentBid = UserRegistration.find_by(user:current_user,bid:@bid)
    render :add_user_bid
  end

  def update_bid
    @bid = Bid.find(params[:bid_id])
    @currentBid = UserRegistration.find_by(user:current_user,bid:@bid)
    updated_bid =  params[:user_registration][:bid_value].to_i
    if updated_bid > @bid.base_price
      if  @currentBid.bid_value < updated_bid && @currentBid.update(bid_value: updated_bid)
        flash[:success] = "Bid value updated successfully"
        redirect_to all_bids_path
      else
        flash[:error] = "Bid value is less than your previous bid"
        render :add_user_bid
      end
    else
      flash[:error] = "Bid value is less than Base Price"
      render :add_user_bid
    end
  end

  def require_vendor
    unless current_user.vendor?
      redirect_to zords_path, alert: "Only vendors can manage zords."
    end
  end
end
