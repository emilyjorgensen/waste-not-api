class PantryItemsController < ApplicationController
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
end
