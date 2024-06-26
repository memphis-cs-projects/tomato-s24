class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:all_requests]
  before_action :require_user, only: [:all_requests, :new_customize_zord, :create_new_zord,:edit,:update_customize_zord,:destroy]
  before_action :require_vendor, only: [:vendor_requests, :approval, :decision_request, ]

  def all_requests
    @requests = current_user.requests.where(status: 'Pending')
    render :all_requests
  end
  def new_customize_zord
    #@requests = CustomizeZord.all
    @request = Request.new
    render :new_customize_zord
  end
  def create_new_zord
    @request = current_user.requests.build(params.require(:request).permit(:material, :theme, :ability, :capacity))
    if @request.save
      flash[:success] = 'New Request successfully added!'
      redirect_to requests_all_requests_path
    else
      flash.now[:error] = @request.errors.full_messages.join(', ')
      render :new_customize_zord, status: :unprocessable_entity
    end
  end
  def show
    @request = Request.find_by(id: params[:id])
    if @request
      if @request.user != current_user
        @requests = current_user.requests.where(status: 'Pending')
        flash.now[:error] = "You cannot access this request"
        render :all_requests
      else
        render :show
      end
    else
      @requests = current_user.requests.where(status: 'Pending')
        flash.now[:error] = "You cannot access this request"
        render :all_requests
    end
  end
  def edit
    @request = Request.find(params[:id])
    render :edit
  end
  def update_customize_zord
    @request = Request.find(params[:id])
    if @request.update(params.require(:request).permit(:material, :theme, :ability, :capacity))
      flash[:success] = 'Request successfully updated!'
      redirect_to request_url(@request)
    else
      flash.now[:error] = @request.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    flash[:success] = 'The to-do item was successfully destroyed.'
    redirect_to requests_all_requests_url, status: :see_other
  end


  def vendor_requests
    @requests = Request.where(status: 'Pending')
    render :vendor_requests
  end


  def approval
    @request = Request.find(params[:id])
    render :approval
  end

  def decision_approval_request
    @request = Request.find(params[:id])
    @zord = Zord.new(params.require(:request).permit(:price, :description, :name, :figure_image))
    @notification = Notification.new(params.require(:request).permit(:message))
    @notification.user = @request.user
    @zord.material = @request.material
    @zord.capacity = @request.capacity
    @zord.ability = @request.ability
    @zord.theme = @request.theme
    @request.status = 'Approved'
    @notification.subject = "Vendor's Reply about your Request"  + @request.id.to_s
    @notification.request = @request
    @notification.zord = @zord
    @request.save
    @notification.message = @request.status + " - "+ @zord.name
    @notification.status = "Approved"
    @zord.save
    @zord = Zord.find(params[:id])
    if @zord.save
      if @notification.save
        flash[:success] = 'New Request successfully approved!'
        redirect_to zords_path, status: :see_other
      else
        flash.now[:error] = @notification.errors.full_messages.join(', ')
        render :approval, status: :unprocessable_entity
    end
    else
      flash.now[:error] = @zord.errors.full_messages.join(', ')
      render :approval, status: :unprocessable_entity
    end
  end

  def reject
    @request = Request.find(params[:id])
    render :reject
  end

  def decision_reject_request
    @request = Request.find(params[:id])
    @notification=Notification.new(params.require(:request).permit(:message))
    @notification.user = @request.user
    @zord = Zord.new(params.require(:request).permit(:price, :description, :name, :figure_image))
    @notification = Notification.new(params.require(:request).permit(:message))
    @notification.user = @request.user
    @zord.material = @request.material
    @zord.capacity = @request.capacity
    @zord.ability = @request.ability
    @zord.theme = @request.theme
    @notification.subject = "Vendor's Reply about your Request" + @request.id.to_s
    @notification.status = "Rejected"
    @notification.zord =@zord
    @notification.request = @request
    if @notification.save
      flash[:success] = 'Request Rejected!'
      #@request.destroy
      @request.reload
      @request.status = 'Rejected'
      @request.save
      #@zord.destroy
      redirect_to requests_vendor_requests_path
    else
      flash.now[:error] = @notification.errors.full_messages.join(', ')
      render :reject, status: :unprocessable_entity
    end
  end

  def require_user
    unless !current_user.vendor?
      redirect_to zords_path, alert: "Only Users can manage Requests."
    end
  end
  def require_vendor
    unless current_user.vendor?
      redirect_to zords_path, alert: "Only vendors can manage Requests."
    end
  end
end
