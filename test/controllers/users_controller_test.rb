require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password", image_url: "https://t4.ftcdn.net/jpg/02/15/84/43/360_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg" }
      assert_response 201
    end
  end

  # test "index" do
  #   get "/users.json"
  #   assert_response 200

  #   data = JSON.parse(response.body)
  #   assert_equal User.count, data.length
  # end

  # test "show" do
  #   get "/users/#{User.first.id}.json"
  #   assert_response 200

  #   data = JSON.parse(response.body)
  #   assert_equal ["id", "name", "email", "image_url", "created_at", "updated_at"], data.keys
  # end

  test "update" do
    user = User.first
    patch "/users/#{user.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  # test "destroy" do
  #   assert_difference "User.count", -1 do
  #     delete "/users/#{User.first.id}.json"
  #     assert_response 200
  #   end
  # end
end
