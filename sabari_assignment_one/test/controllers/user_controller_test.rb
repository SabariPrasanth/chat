require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get friends" do
    get user_friends_url
    assert_response :success
  end

end
