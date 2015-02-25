class ProductReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @product_review = ProductReview.new
  end

  def create
    @product  = Product.find(params[:product_id])
    if current_user
      @product_review = ProductReview.new(product_review_params)
      @product_review.product_id = @product.id
      @product_review.user_id = current_user.id
      if @product_review.save
        redirect_to reviews_path
      else
        redirect_to new_product_product_review_path(@product), notice: "Form is invalid"
      end
    else
      redirect_to login_path, notice: "Must be logged in to review a product"
    end
  end

  private
  def product_review_params
    params.require(:product_review).permit(:title, :description, :rating)
  end

end
