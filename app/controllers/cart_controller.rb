class CartController < ApplicationController

  def add_to_cart
    # Find the zord based on the params
    zord = Zord.find(params[:zord_id])

    flash[:success] = "Line 7"

    # Find or create the user's cart
    cart = current_user.cart || current_user.create_cart

    # Create a new cart item associated with the cart and the zord
    cart_item = cart.cart_items.build(zord: zord, quantity: 1)

    if cart_item.save
      flash[:success] = "#{zord.name} has been added to the cart."
      redirect_to zords_url
    else
      flash.now[:error] = 'Failed adding to the cart.'
      render :new, status: :unprocessable_entity
    end
  end

  def index
    # Fetch cart items associated with the current user
    @cart= Cart.all
    render :index
  end

end
