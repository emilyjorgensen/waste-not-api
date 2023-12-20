class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    render :index
  end

  def create
    @ingredient = Ingredient.create(
      name: params[:name],
      image_url: params[:image_url],
    )
    render :show
  end
end
