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
      @product_review.save
      redirect_to products_path
    else
      redirect_to login_path, notice: "Must be logged in to review a product"
    end
  end

  private
  def product_review_params
    params.require(:product_review).permit(:title, :desciption, :rating)
  end

end
