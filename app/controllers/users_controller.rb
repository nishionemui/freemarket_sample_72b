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

  def profile
    @profile = User.find(params[:id])
  end

  def card
  end

  def address
    @address = Address.find(params[:id])
  end

  def introduce
    @introduce = User.find(params[:id])
  end

  def phone
    @phone = User.find(params[:id])
  end

  def update
    if params[:address] == nil
      if @profile
        @profile = User.find(params[:id])
        if @profile.update(user_params)
          redirect_to user_path(current_user.id)
        else
          render :profile
        end
      elsif @introduce
        @introduce = User.find(params[:id])
        if @introduce.update(user_params)
          redirect_to user_path(current_user.id)
        else
          flash.now[:alert] = @introduce.errors.full_messages
          render :introduce
        end
      else @phone
        @phone = User.find(params[:id])
        if @phone.update(user_params)
          redirect_to user_path(current_user.id)
        else
          flash.now[:alert] = @phone.errors.full_messages
          render :phone
        end
      end
    else params[:user] == nil
      @address = Address.find(params[:id])
      if @address.update(address_params)
        redirect_to user_path(current_user.id)
      else
        flash.now[:alert] = @address.errors.full_messages
        render :address
      end
    end
  end

  def deletion
  end

  def like
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).page(params[:page]).per(10)
  end

  private 
  def user_params 
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :user_image, :first_name, :last_name,:first_name_read, :last_name_read, :introduction, :birthday,:phone_num)
  end

  def address_params
    params.require(:address).permit(:zip_code, :prefecture_id, :city, :address1, :address2)
  end
end