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
    @zord.destroy
    flash[:success] = "Bid Successfully deleted along with Zord"
    redirect_to all_bids_path
  end

  def require_vendor
    unless current_user.vendor?
      redirect_to zords_path, alert: "Only vendors can manage zords."
    end
  end
end
