class NotificationsController < ApplicationController

  def all_notifications
    @notifications = current_user.notifications
    render :all_notifications
  end

  def show_notification
    @notification = Notification.find(params[:id])
    render :show_notification
  end

end
