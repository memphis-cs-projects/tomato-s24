class BidsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_vendor, only:[:add_bid, :create_bid,:destroy]

  def index
    @bids = Bid.all
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
