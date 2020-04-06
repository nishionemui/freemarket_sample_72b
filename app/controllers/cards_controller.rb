class CardsController < ApplicationController
  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
  end

  def destroy
  end

  private 
  def card_params 
    # params.require (:card).permit(:card_id, :token, :customer_id, :).merge(user_id: current_user.id)
  end

end
