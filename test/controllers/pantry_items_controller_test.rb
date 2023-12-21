require "test_helper"

class PantryItemsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/pantry_items.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal PantryItem.count, data.length
  end

  test "create" do
    assert_difference "PantryItem.count", 1 do
      post "/pantry_items.json", params: { user_id: 1, ingredient_id: 1, amount: "1 block", category: "pantry", use_by_date: "01/01/25" }
      assert_response 200
    end
  end

  test "show" do
    get "/pantry_items/#{PantryItem.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "ingredient_id", "amount", "category", "use_by_date", "created_at", "updated_at"], data.keys
  end

  test "update" do
    pantry_item = PantryItem.first
    patch "/pantry_items/#{pantry_item.id}.json", params: { amount: "Updated amount" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated amount", data["amount"]
  end

  test "destroy" do
    assert_difference "PantryItem.count", -1 do
      delete "/pantry_items/#{PantryItem.first.id}.json"
      assert_response 200
    end
  end
end
