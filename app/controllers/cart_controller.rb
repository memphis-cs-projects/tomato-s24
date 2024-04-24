class CartController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = []
    cart = current_user.cart
    if cart
      @cart_items = cart.cart_items
    end
    render :index
  end

  def add_to_cart
    # Find the zord based on the params
    zord = params[:zord_id].present? ? Zord.find(params[:zord_id]) : Zord.find(params[:id])
    notification = params[:notification_id].present? ? Notification.find(params[:notification_id]) : nil

    # Find or create the user's cart
    cart = current_user.cart || current_user.create_cart

    # Find the cart item based on the zord
    cart_item = cart.cart_items.find_by(zord: zord)

    if cart_item
      cart_item.quantity += 1
    else
      # Create a new cart item associated with the cart and the zord
      cart_item = cart.cart_items.build(zord: zord, quantity: 1)
    end

    if cart_item.save
      flash[:success] = "#{zord.name} #{notification&.message || 'has been added to the cart.'}"  # Use safe navigation (&.) to handle nil notification
      if notification
        notification.status = "Customization Paid"
        notification.save
      end
      redirect_to zords_url
    else
      flash.now[:error] = 'Failed adding to the cart.'
      render :new, status: :unprocessable_entity
    end
  end


  def remove_from_cart
    cart_item = CartItem.find(params[:id])
    if cart_item.cart == current_user.cart
      cart_item.destroy
      flash[:success] = "zord has been removed from the cart."
    else
      flash[:error] = "You can't remove an zord"
    end
    redirect_to cart_url
  end

end
