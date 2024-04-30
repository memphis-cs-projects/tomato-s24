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

    def vendor_index
      @resales = Resale.all
    end
  
    # PATCH/PUT /resales/:id/update_status
    # app/controllers/resales_controller.rb

    def update_status
      @resale = Resale.find(params[:id])
  
      if @resale.update(resale_params)
        if @resale.status == "approved"
          # Find the associated user for the resale
          user = @resale.user
  
          if user
            # Find or create the associated account balance for the user
            account_balance = user.account_balance || user.create_account_balance(balance: 0)
  
            # Increment the user's account balance by the new price of the resale request
            account_balance.increment!(:balance, @resale.new_price)
  
            flash[:notice] = "Resale status updated successfully. User has been credited."
          else
            flash[:alert] = "Error updating user's account balance. User not found."
          end
        else
          flash[:notice] = "Resale status updated successfully."
        end
      else
        flash[:alert] = "Error updating resale status."
      end
  
      redirect_to vendor_index_resales_path
    end
  
    
    

    def destroy
      @resale.destroy
      redirect_to orders_path, notice: "Resale request has been removed."
    end
  
  
    private
  
    def set_resale
      @resale = current_user.resales.find(params[:id])
    end

    def check_vendor
      redirect_to root_path unless current_user.vendor?
    end
  
    def resale_params
      params.require(:resale).permit(:zord_id, :user_id, :new_price, :condition, :status)
    end
  end
  