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

    if @notification.save
      flash[:success] = "Notification sent to " + user.email
      redirect_to all_bids_path
    else
      flash.now[:error] = "Not able to save notification"
      redirect_to all_bids_path, status: :unprocessable_entity
    end
  end

  def view_winner_notification
    @notification = Notification.find(params[:notification_id])
    notification_subject = @notification.subject
    zord_name = notification_subject.sub("Winner of Bidding for ", "")
    @zord = Zord.find_by(name: zord_name)
    bid = Bid.where(zord: @zord)
    notification_message = @notification.message
    bid_amount = notification_message.match(/The bid amount is (\d+)/)[1].to_i
    @zord.update(price: bid_amount)
    
    render :view_winner_notification
  end


end
