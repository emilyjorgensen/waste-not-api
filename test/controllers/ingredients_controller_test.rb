require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/ingredients.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Ingredient.count, data.length
  end

  test "create" do
    assert_difference "Ingredient.count", 1 do
      post "/ingredients.json", params: { name: "test", image_url: "test.com" }
      assert_response 200
    end
  end

  test "show" do
    get "/ingredients/#{Ingredient.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "image_url", "created_at", "updated_at"], data.keys
  end

  test "update" do
    ingredient = Ingredient.first
    patch "/ingredients/#{ingredient.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Ingredient.count", -1 do
      delete "/ingredients/#{Ingredient.first.id}.json"
      assert_response 200
    end
  end
end
