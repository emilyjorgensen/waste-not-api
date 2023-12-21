class IngredientsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @ingredients = Ingredient.all
    render :index
  end

  def create
    @ingredient = Ingredient.create(
      name: params[:name],
      image_url: params[:image_url],
    )
    if @ingredient.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
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
    if @ingredient.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @ingredient.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @ingredient = Ingredient.find_by(id: params[:id])
    @ingredient.destroy
    render json: { message: "Ingredient destroyed successfully" }
  end
end
