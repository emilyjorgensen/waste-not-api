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

  def show
    @ingredient = Ingredient.find_by(id: params[:id])
    render :show
  end

  def update
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.update(
      name: params[:name] || @ingredient.name,
      image_url: params[:image_url] || @ingredient.image_url,
    )
    render :show
  end

  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.destroy
    render json: { message: "Ingredient destroyed successfully" }
  end
end
