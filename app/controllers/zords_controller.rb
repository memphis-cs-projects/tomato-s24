class ZordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_vendor, only: [:new, :create, :edit, :update, :destroy]

  def index
    @q = Zord.ransack(params[:q])
    @zords = @q.result(distinct: true).order(:id)
    render :index
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

  def edit
    @zord = Zord.find(params[:id])
    render :edit
  end

  def update
    @zord = Zord.find(params[:id])
    if @zord.update(params.require(:zord).permit(:name, :description, :price, :figure_image, :ability, :capacity, :quantity, :theme))
      flash[:success] = 'Zord was successfully updated!'
      redirect_to zord_url(@zord)
    else
      flash.now[:error] = 'Oops! Zord update failed.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @zord = Zord.find(params[:id])
    @zord.destroy
    flash[:success] = 'Zord was successfully deleted!'
    redirect_to zords_url
  end

  def require_vendor
    unless current_user.vendor?
      redirect_to zords_path, alert: "Only vendors can manage zords."
    end
  end


end
