require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get travel_options" do
    get travel_options_path
    assert_response :success
  end
end
