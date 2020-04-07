class ProductsController < ApplicationController
  def index

    @product = Product.all
    # @products =[]
    # @products <<  @product
  end
  
  def new
    @products = Product.new
 
  end

  def create
    @products = Product.create(product_params)
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  private 
  def product_params 
    params.require(:product).permit(:product_name, :description, :brand_id, :condition_id, :delivery_fee_id, :delivery_date_id, :delivery_way_id, :prefecture_id, :price, :size_id).merge(user_id: current_user.id)
  end
end
