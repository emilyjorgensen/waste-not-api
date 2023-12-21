class PantryItemsController < ApplicationController
  def index
    @pantry_items = PantryItem.all
    render :index
  end
end
