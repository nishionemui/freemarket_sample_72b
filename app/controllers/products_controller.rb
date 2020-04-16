class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show,:purchase, :pay, :done]
  before_action :set_card, only: [:purchase, :pay, :done]

  def index
  @product = Product.all
  @parents = MainCategory.all.order("id ASC").limit(13)
  end
  
  def new
    @product = Product.new
    @image = @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render :create
    else
      @image = @product.images.build
      render :new
    end
  end

  def edit
    @parents = MainCategory.all.order("id ASC").limit(607)
  end

  def update
    @parents = MainCategory.all.order("id ASC").limit(607)
    if params[:product][:images_attributes] && @product.update(edit_product_params)
      redirect_to product_path(@product.id)
    else
      render action: :edit
    end
  end

  def show
    @parents = MainCategory.all.order("id ASC").limit(607)
    @comment = Comment.new
    @comments = @product.comments.includes(:user)
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      render :destory
    else
      redirect_to product_path(@product.id)
    end
  end

  # < 商品購入アクション purchase、pay、done>
  def purchase
    if @card.blank?
      flash.now[:alert] = 'カードを登録してください。'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @product.price,
    customer: @card.customer_id,
    card: params['payjp-token'],
    currency: 'jpy'
    )
    if @product.update( buyer_id: current_user.id)
      redirect_to done_products_path(@product.id)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def done
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #保管した顧客IDでpayjpから情報取得
    customer = Payjp::Customer.retrieve(@card.customer_id)
    #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    @default_card_information = customer.cards.retrieve(@card.card_id)
  end

  def list
    @product = Product.all
  end


  def mid_category
    @mid_categories = MainCategory.where(ancestry: params[:big_category_id])
    render json: @mid_categories
  end

  def small_category
    @small_categories = MainCategory.where(ancestry: "#{params[:big_category_id]}/#{params[:mid_category_id]}")
    render json: @small_categories
  end

  def search
    @product = Product.product_name(params[:keyword])
    @parents = MainCategory.all.order("id ASC").limit(13)
  end


  private 
  def product_params 
    params.require(:product).permit(:product_name, :description, :category_id, :brand, :condition_id, :delivery_fee_id, :delivery_date_id, :delivery_way_id, :prefecture_id, :price, :size_id, [images_attributes: [:image]]).merge(user_id: current_user.id)
  end

  def edit_product_params 
    params.require(:product).permit(:product_name, :description, :category_id, :brand, :condition_id, :delivery_fee_id, :delivery_date_id, :delivery_way_id, :prefecture_id, :price, :size_id, [images_attributes: [:image, :_destroy, :id]]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end
end
