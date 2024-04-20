class NotificationsController < ApplicationController

  def all_notifications
    @notifications = current_user.notifications
    render :all_notifications
  end
end
