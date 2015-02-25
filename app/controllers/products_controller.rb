class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end


    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to product_path(@product)
      else
        redirect_to new_product_path, notice: 'Product form invalid'
      end
    end

    private
    def product_params
      params.require(:product).permit(:name, :price, :company_id)
    end

end
