class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:all_requests]
  def all_requests
    @requests = Request.all
    render :all_requests
  end
  def new_customize_zord
    #@requests = CustomizeZord.all
    @request = Request.new
    render :new_customize_zord
  end
  def create_new_zord
    @request = Request.new(params.require(:request).permit(:material, :theme, :ability, :capacity))
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

end
