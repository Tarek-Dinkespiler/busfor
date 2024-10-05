require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Home" do
    get root_path
    assert_response :success
  end
end
