# app/controllers/resales_controller.rb

class ResalesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_resale, only: [:show, :edit, :update, :destroy]
  
    def index
      @resales = current_user.resales
    end

    def show
      @resale = Resale.find(params[:id])
    end
  
    def new
      @resale = Resale.new
      @zord = Zord.find(params[:zord_id])
    end
  
    def create
      @resale = Resale.new(resale_params)
      @resale.status = :pending # Set initial status to 'pending'
      
      if @resale.save
        redirect_to resales_index_path, notice: "Resale item created successfully."
      else
        render :new
      end
    end

    def destroy
      @resale.destroy
      redirect_to orders_path, notice: "Resale request has been removed."
    end
  
  
    private
  
    def set_resale
      @resale = current_user.resales.find(params[:id])
    end
  
  
    def resale_params
      params.require(:resale).permit(:zord_id, :user_id, :new_price, :condition, :status)
    end
  end
  