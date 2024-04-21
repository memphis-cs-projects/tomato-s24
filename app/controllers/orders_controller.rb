class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
    render :index
  end

  def address
    @address = Address.new
    render :address
  end

  def show
    @order = Order.find(params[:id])
    render :show
  end

  def create_address
    @address = Address.new(params.require(:address).permit(:street_address, :city, :state, :zipcode))

    if @address.save
      redirect_to payment_path(address_id: @address.id), notice: 'Address was successfully added.'
    else
      render :new #Render the new template if there are validation errors
    end
  end

  def payment
    @address_id = params[:address_id]
    @payment = Payment.new
    render :payment
  end

  def create_payment
    @address_id = params[:payment][:address_id]
    @payment = Payment.new(params.require(:payment).permit(:card_type, :card_number, :expiry_date))

    if @payment.save
      redirect_to checkout_path(address_id: @address_id, payment_id: @payment.id), notice: 'Payment details successfully added.'
    else
      render :new # Render the new template if there are validation errors
    end
  end

  def checkout
    @address = Address.find(params[:address_id])
    @payment = Payment.find(params[:payment_id])

    # Assuming current_user is available and represents the user
    @order = Order.new(user: current_user, address: @address, payment: @payment, status: "Pending") # You may need to adjust status based on your requirements

    # Iterate over each item in the user's cart
    current_user.cart.cart_items.each do |cart_item|
      # Create an order item for each cart item
      @order_item = @order.order_items.build(
        zord: cart_item.zord, # Assuming zord is the item being ordered
        quantity: cart_item.quantity,
        # Add other attributes as needed
      )

      # Associate the order item with the order
      @order_item.save
    end

    if @order.save
      # Empty the user's cart once the order is successfully created
      current_user.cart.cart_items.destroy_all

      redirect_to review_path(@order)
    else
      # Handle unsuccessful order creation
    end
  end

  def review
    @order = Order.find(params[:id])
    render :review
  end

  def place
    @order = Order.find(params[:id])
    @order.status = 'Placed'
    if @order.save
      render :place
    else
      redirect_to review_path(@order), notice: 'Error occured while placing the order. Please try again later.'
    end
  end

end
