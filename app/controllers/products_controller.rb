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
        redirect_to root_path
      else
        render :new, notice: 'Product form invalid'
      end
    end

    private
    def product_params
      params.require(:product).permit(:name, :price, :company_id)
    end

end
