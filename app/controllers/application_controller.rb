class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_ancestry
  # before_action :set_search

  
  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  # def set_search
  #   @q = Product.ransack(params[:q])
  #   @products = @q.result(distinct: true)
  # end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:user_image, :first_name,:last_name,:first_name_read,:last_name_read,:phone_num, :birthday ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:user_image, :first_name,:last_name,:first_name_read,:last_name_read,:phone_num, :birthday ])
  end
  def set_ancestry
    @parents = MainCategory.where(ancestry: nil)
  end
end




