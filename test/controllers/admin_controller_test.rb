require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get inde" do
    get admin_inde_url
    assert_response :success
  end
end
