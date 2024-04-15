class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:all_requests]
  before_action :require_permission, except: [:all_requests, :show, :new_customize_zord, :create_new_zord]
  before_action :require_user, except: [:all_requests]
  def require_permission
    if Request.find(params[:id]).user != current_user
      flash[:error] = 'You do not have permission to do that.'
      redirect_to quizzes_path
    end
  end
  def all_requests
    @requests = current_user.requests
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
    @request = Request.find(params[:id])
    render :show
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
