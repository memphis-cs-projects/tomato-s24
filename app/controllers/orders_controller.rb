class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.order(created_at: :desc)
    render :index
  end

  def show
    @order = Order.find(params[:id])
    render :show
  end

  def address
    @address = Address.new
    @addresses = current_user.addresses
    render :address
  end

  def create_address
    @address = current_user.addresses.new(params.require(:address).permit(:street_address, :city, :state, :zipcode))

    if @address.save
      #Handle reorder action
      if params[:address][:order_id].present?
        redirect_path = payment_path(address_id: @address.id, order_id: params[:address][:order_id])
      else
        redirect_path = payment_path(address_id: @address.id)
      end
      redirect_to redirect_path, notice: 'Address details saved successfully.'
    else
      render :new #Render the new template if there are validation errors
    end
  end

  def payment
    @payment = Payment.new
    @payments = current_user.payments
    render :payment
  end

  def create_payment
    expiry_month = params[:payment][:expiry_month]
    expiry_year = params[:payment][:expiry_year]

    # Create a new Payment object with the expiry date set to the end of the selected month
    expiry_date = Date.new(expiry_year.to_i, expiry_month.to_i).end_of_month

    @payment = current_user.payments.new(payment_params.merge(expiry_date: expiry_date))

    if @payment.save
      #Handle reorder action
      if params[:payment][:order_id].present?
        redirect_path = review_path(address_id: params[:payment][:address_id], payment_id: @payment.id, order_id: params[:payment][:order_id])
      else
        redirect_path = review_path(address_id: params[:payment][:address_id], payment_id: @payment.id)
      end
      redirect_to redirect_path, notice: 'Payment details saved succesfully.'
    else
      render :new # Render the new template if there are validation errors
    end
  end

  # Strong parameters method to whitelist allowed attributes
  def payment_params
    params.require(:payment).permit(:card_type, :card_number)
  end

  def review
    @address = Address.find(params[:address_id])
    @payment = Payment.find(params[:payment_id])

    # Handle reorder action
    if params[:order_id].present?
      @prev_order = Order.find(params[:order_id])
    end

    # Assuming current_user is available and represents the user
    @order = Order.new(user: current_user, address: @address, payment: @payment, status: "Pending") # You may need to adjust status based on your requirements

    if !@prev_order.nil?
       # Iterate over each item in the user's previous order
       @prev_order.order_items.each do |item|
        # Create an order item for each previous order item
        @order_item = @order.order_items.build(
          zord: item.zord, # Assuming zord is the item being ordered
          quantity: item.quantity,
        )
        # Associate the order item with the order
        @order_item.save
      end
    else
      # Iterate over each item in the user's cart
      current_user.cart.cart_items.each do |cart_item|
        # Create an order item for each cart item
        @order_item = @order.order_items.build(
          zord: cart_item.zord, # Assuming zord is the item being ordered
          quantity: cart_item.quantity,
        )
        # Associate the order item with the order
        @order_item.save
      end
    end

    if @order.save
      render :review
    else
      # Handle unsuccessful condition
    end
  end

  def place
    @order = Order.find(params[:id])
    @order.status = 'Placed'
    if @order.save
      # Empty the user's cart once the order is successfully placed
      current_user.cart.cart_items.destroy_all

      render :place
    else
      redirect_to review_path(@order), notice: 'Error occured while placing the order. Please try again later.'
    end
  end

end
