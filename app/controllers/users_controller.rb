class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.create(use_params)
  end


  def show
    @user = User.find(params[:id])

  end

  def destroy
    
  end

  # def signout
  #   # @user = User.find(params[:id])
    
  # end

  def profile
    @profile = User.find(params[:id])
  end

  def card

  end

  def address
    @address = Address.find(params[:id])
  end

  def update
    if params[:address] == nil
      @profile = User.find(params[:id])
      if @profile.update(user_params)
        redirect_to user_path(current_user.id)
      else
        render :profile
      end
    else params[:user] == nil
      @address = Address.find(params[:id])
      if @address.update(address_params)
        redirect_to user_path(current_user.id)
      else
        render :address
      end
    end

  end

  private 
  def user_params 
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :user_image, :first_name, :last_name,:first_name_read, :last_name_read, :introduction, :birthday,:phone_num)
  end

  def address_params
    params.require(:address).permit(:zip_code, :prefecture_id, :city, :address1, :address2)
  end
end