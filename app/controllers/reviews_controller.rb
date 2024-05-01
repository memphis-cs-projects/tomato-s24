class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def all_reviews
    zord = Zord.find(params[:zord_id])
    # Pass data to the Zords controller
    redirect_to zord_path(id: zord.id)
  end

  def new_review
    @review = Review.new
    @order_item_id = params[:order_item_id] # Pass order_item_id to the form
    @zord_id = params[:zord_id]
    render :new_review
  end

  def create_new_review
    @review = current_user.reviews.build(params.require(:review).permit(:review_message, :rating))
  begin
    @review.order_item = OrderItem.find(params[:order_item_id])
    @review.zord = Zord.find(params[:zord_id])
    @review.review_message = "#{@review.order_item.zord.name}" + " " + @review.review_message
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'OrderItem not found.'
    redirect_to orders_path # Redirect to an appropriate path
    return
  end
    if @review.save
      flash[:success] = "#{@review.order_item.zord.name} New Review successfully added!"
      redirect_to all_reviews_path(zord_id: @review.zord.id)
    else
      flash.now[:error] = @review.errors.full_messages.join(', ')
      render :new_review, status: :unprocessable_entity
    end
  end
end
