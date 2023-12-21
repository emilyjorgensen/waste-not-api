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
      post "/pantry_items.json", params: { user_id: 1, pantry_item: 1, amount: "1 block", category: "pantry", use_by_date: "01/01/25" }
      assert_response 200
    end
  end
end
