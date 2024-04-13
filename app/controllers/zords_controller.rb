class ZordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_vendor, only: [:new, :create]

  def index
    @q = Zord.ransack(params[:q])
    @zords = @q.result(distinct: true).order(:id)
  end

  def show
    @zord = Zord.find(params[:id])
    render :show
  end


  def new
    if current_user.vendor?
      @zord = Zord.new
      render :new
    else
      redirect_to zords_path, alert: "Only vendors can add new zords."
    end
  end

  def create
    if current_user.vendor?
      @zord = Zord.new(params.require(:zord).permit(:name, :description, :price, :figure_image, :ability, :capacity, :quantity, :theme))
      if @zord.save
        flash[:success] = 'Hurray Zord was successfully added!'
        redirect_to zords_url
      else
        flash.now[:error] = 'Oops Zord creation failed'
        render :new, status: :unprocessable_entity
      end
    else
      redirect_to zords_path, alert: "Only vendors can add new zords."
    end
  end

  def require_vendor
    unless current_user.vendor?
      redirect_to zords_path, alert: "Only vendors can add new zords."
    end
  end


end
