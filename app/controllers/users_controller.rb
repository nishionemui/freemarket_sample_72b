class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @uswer = User.create(use_params)
  end

  def update
  
  end


  def show
    @user = User.find(params[:id])
   
  end

  private 
  def user_params 
    require params(:product).parmit(:nickname, :first_name,:last_name,:first_name_read,:last_name_read,:phone_num, :birthday, :user_image)
  end
end