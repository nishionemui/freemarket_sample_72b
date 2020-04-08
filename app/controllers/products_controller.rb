class ProductsController < ApplicationController

  # active:hashメソッド定義した場合使う
  # before_action :set_condition, only: [:show]
  # before_action :set_prefecture, only: [:show]
  # before_action :set_delivery, only: [:show]

  def index
  @product = Product.all
  @parents = MainCategory.all.order("id ASC").limit(13)
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

  def edit
    @products = Product.find(params[:id])
    @image = @products.images.build
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render :destory
  end

  def purchase
  end

  def pay
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      charge = Payjp::Charge.create(
      # amount: @product.price,
      amount: 300,
      card: params['payjp-token'],
      currency: 'jpy'
      )
      redirect_to done_products_path
  end

  def done
  end


  private 
  def product_params 
    params.require(:product).permit(:product_name, :description, :brand_id, :condition_id, :delivery_fee_id, :delivery_date_id, :delivery_way_id, :prefecture_id, :price, :size_id, images_attributes: [:image]).merge(user_id: current_user.id)
  end

  # # 商品の状態
  # def set_condition
  #   @condition = Condition.find(@product.condition_id)
  # end

  # # 配送元地域
  # def set_prefecture
  #   @prefecture = Prefecture.find(@product.prefecture_id)
  # end

  # # 発送日目安、配送方法、配送料の負担
  # def set_delivery
  #   @delivery_fee = DeliveryFee.find(@product.delivery_fee_id)
  #   @delivery_way = DeliveryWay.find(@product.delivery_way_id)
  #   @delivery_date = DeliveryDate.find(@product.delivery_date_id)
  # end
end
