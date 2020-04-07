class ProductsController < ApplicationController
  def index

    @product = Product.all
    # @products =[]
    # @products <<  @product
  end
  
  def new
    @products = Product.new
    @image = @products.images.build
  end

  def create
    @products = Product.create(product_params)
    # if @products.save
    #   product_params[:images]['image'].each do |img|
    #     @image = @products.images.create(:image => img, :product_id => @products.id)
    #   end
    #   redirect_to product_path(@products.id)
    # end
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def pay
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      charge = Payjp::Charge.create(
      # amount: @product.price,
      amount: 300,
      card: params['payjp-token'],
      currency: 'jpy'
      )
  end

  private 
  def product_params 
    params.require(:product).permit(:product_name, :description, :brand_id, :condition_id, :delivery_fee_id, :delivery_date_id, :delivery_way_id, :prefecture_id, :price, :size_id, images_attributes: [:id, :product_id, :image]).merge(user_id: current_user.id)
  end
end
