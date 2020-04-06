class CardsController < ApplicationController


  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  
  end

  def create
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
  end

  def destroy
  end

end