class ProductsController < ApplicationController

  # active:hashメソッド定義した場合使う
  # before_action :set_condition, only: [:show]
  # before_action :set_prefecture, only: [:show]
  # before_action :set_delivery, only: [:show]

  def index
  @product = Product.all
  # @parents = MainCategory.where(ancestry: nil)
  @parents = MainCategory.all.order("id ASC").limit(13)
  end
  
  def new
    @products = Product.new
    @image = @products.images.build
    #セレクトボックスの初期値設定
    @category_parent_array = ["選択して下さい"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    MainCategory.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.main_name
    end
  end

  def create
    @products = Product.create(product_params)
    if @products.save
      render :create
    else
      @image = @products.images.build
      render :new
    end
  end

  def edit
    @products = Product.find(params[:id])
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
    if product.destroy
      render :destory
    else
      redirect_to product_path(@product.id)
    end
  end

  # < 商品購入アクション purchase、pay、done>
  def purchase
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      flash.now[:alert] = 'メッセージを入力してください。'
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      charge = Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer_id,
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
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    #保管した顧客IDでpayjpから情報取得
    customer = Payjp::Customer.retrieve(card.customer_id)
    #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
    @default_card_information = customer.cards.retrieve(card.card_id)
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = MainCategory.find_by(main_name: "#{params[:parent_main_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = MainCategory.find("#{params[:child_id]}").children
  end


  private 
  def product_params 
    params.require(:product).permit(:product_name, :description, :brand_id, :condition_id, :delivery_fee_id, :delivery_date_id, :delivery_way_id, :prefecture_id, :category_id, :price, :size_id, [images_attributes: [:image]]).merge(user_id: current_user.id)
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
