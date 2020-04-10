class ProductsController < ApplicationController


  def index
  @product = Product.all
  # @parents = MainCategory.where(ancestry: nil)
  @parents = MainCategory.all.order("id ASC").limit(13)
  end
  
  def new
    @products = Product.new
    @image = @products.images.build
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
    @product = Product.find(params[:id])
  end

  def pay
    @product = Product.find(params[:id])
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      charge = Payjp::Charge.create(
      amount: @product.price,
      card: params['payjp-token'],
      currency: 'jpy'
      )
      if @product.update( buyer_id: current_user.id)
        redirect_to done_products_path
      else
        redirect_back(fallback_location: root_path)
      end
  end

  def done
    @product = Product.find(params[:id])
  end


  def mid_category
    @mid_categories = MainCategory.where(ancestry: params[:big_category_id])
    render json: @mid_categories
  end

  def small_category
    @small_categories = MainCategory.where(ancestry: "#{params[:big_category_id]}/#{params[:mid_category_id]}")
    render json: @small_categories
  end

  private 
  def product_params 
    params.require(:product).permit(:product_name, :description, :category_id, :brand_id, :condition_id, :delivery_fee_id, :delivery_date_id, :delivery_way_id, :prefecture_id, :category_id, :price, :size_id, [images_attributes: [:image]]).merge(user_id: current_user.id)
  end

  def set_categories
    @categories = Category.where(ancestry: nil)
  end
end
