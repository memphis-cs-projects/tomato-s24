class OrderController < ApplicationController
  before_action :authenticate_user!

  def add_address
    @address = Address.new
    render :address
  end

  def create_address
    @address = Address.new(params.require(:address).permit(:street_address, :city, :state, :zipcode))

    if @address.save
      redirect_to add_payment_path(@order), notice: 'Address was successfully added.'
    else
      render :new #Render the new template if there are validation errors
    end
  end

  def add_payment
    @payment = Payment.new
    render :payment
  end

  def create_payment
    @payment = Payment.new(params.require(:payment).permit(:card_type, :card_number, :expiry_date))

    if @payment.save
      redirect_to add_payment_path, notice: 'Payment details successfully added.'
    else
      render :new #Render the new template if there are validation errors
    end
  end
end
