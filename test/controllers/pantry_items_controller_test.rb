require "test_helper"

class PantryItemsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/pantry_items.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal PantryItem.count, data.length
  end
end
