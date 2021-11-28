require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get friends_home_url
    assert_response :success
  end

end
