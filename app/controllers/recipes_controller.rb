class RecipesController < ApplicationController
  def index
    response = HTTP.get("https://api.spoonacular.com/recipes/random?apiKey=APIKEY&number=9")
    data = JSON.parse(response.body)
    render json: data
  end
end
