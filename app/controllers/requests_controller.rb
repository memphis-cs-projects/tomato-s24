class RequestsController < ApplicationController
  def all_requests
    @requests = Request.all
    render :all_requests
  end
  def new_customize_zord
    #@requests = CustomizeZord.all
    @request = Request.new
    render :new_customize_zord
  end
  def create
    @request = Request.new(params.require(:request).permit(:material, :theme, :ability, :capacity))
    if @request.save
      flash[:success] = 'New to-do item successfully added!'
      redirect_to requests_all_requests_path
    else
      flash.now[:error] = 'To-do item creation failed'
      render :new_customize_zord, status: :unprocessable_entity
    end
  end
end
