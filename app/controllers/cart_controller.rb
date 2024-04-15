class CartController < ApplicationController

  def add_to_cart
    # Find the zord based on the params
    zord = Zord.find(params[:id])

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
      flash[:success] = "#{zord.name} has been added to the cart."
      redirect_to zords_url
    else
      flash.now[:error] = 'Failed adding to the cart.'
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @cart_items = []
    cart = current_user.cart
    if cart
      @cart_items = cart.cart_items
    end
    render :index
  end

end
