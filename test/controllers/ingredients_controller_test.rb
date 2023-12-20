require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/ingredients.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Ingredient.count, data.length
  end
end
