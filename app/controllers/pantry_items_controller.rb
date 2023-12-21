class PantryItemsController < ApplicationController
  before_action :authenticate_user

  def index
    @pantry_items = PantryItem.all
    render :index
  end

  def create
    @pantry_item = PantryItem.create(
      user_id: params[:user_id],
      ingredient_id: params[:ingredient_id],
      amount: params[:amount],
      category: params[:category],
      use_by_date: params[:use_by_date],
    )
    render :show
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
    render :show
  end

  def destroy
    @pantry_item = PantryItem.find_by(id: params[:id])
    @pantry_item.destroy
    render json: { message: "Pantry item destroyed successfully" }
  end
end
