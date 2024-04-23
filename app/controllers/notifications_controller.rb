class NotificationsController < ApplicationController

  def all_notifications
    @notifications = current_user.notifications
    render :all_notifications
  end

  def winner_notification
    @bid = Bid.find(params[:bid_id])
    @user_reg = UserRegistration.where(bid: @bid).order(bid_value: :desc).first
    user = @user_reg.user
    @notification=Notification.new()
    @notification.message = "Congratulations! #{user.email}\n
                          You are the winner of the bidding for #{@bid.zord.name}\n.
                          Please make the payment\n.
                          The bid amount is #{@user_reg.bid_value}."
    @notification.user = user
    @notification.request_id = 1
    @notification.subject = "Winner of Bidding for " + @bid.zord.name

    # zord = Zord.find(params[:id])
    # cart = user.cart || user.create_cart
    # cart_item = cart.cart_items.build(zord: zord, quantity: 1)

    # if cart_item.save
    #   flash[:success] = "#{zord.name} has been added to the cart."
    #   redirect_to zords_url
    # else
    #   flash.now[:error] = 'Failed adding to the cart.'
    #   render :new, status: :unprocessable_entity
    # end
    if @notification.save
      flash[:success] = "Notification sent to " + user.email
      redirect_to all_bids_path
    else
      flash.now[:error] = "Not able to save notification"
      redirect_to all_bids_path, status: :unprocessable_entity
    end
  end

end
