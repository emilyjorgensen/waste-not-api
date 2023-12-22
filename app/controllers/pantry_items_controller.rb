class PantryItemsController < ApplicationController
  before_action :authenticate_user

  def index
    @pantry_items = PantryItem.all
    render :index
  end

  def create
    @pantry_item = PantryItem.create(
      user_id: current_user.id,
      ingredient_id: params[:ingredient_id],
      amount: params[:amount],
      category: params[:category],
      use_by_date: params[:use_by_date],
    )
    if @pantry_item.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @pantry_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @pantry_item = PantryItem.find_by(id: params[:id])
    render :show
  end

  def update
    @pantry_item = PantryItem.find_by(id: params[:id])
    @pantry_item.update(
      amount: params[:amount] || @pantry_item.amount,
      category: params[:category] || @pantry_item.category,
      use_by_date: params[:use_by_date] || @pantry_item.use_by_date,
    )
    if @pantry_item.valid? #happy path
      render :show
    else #sad path
      render json: { errors: @pantry_item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @pantry_item = PantryItem.find_by(id: params[:id])
    @pantry_item.destroy
    render json: { message: "Pantry item destroyed successfully" }
  end
end
