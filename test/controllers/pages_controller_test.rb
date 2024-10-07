require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  # REFACTOR NEEDED
  #
  # The following integration tests should test the potential outcomes of the controller service
  # While the behaviour of the get travel options functionality should be tested end to end
  #

  # http://localhost:3000/schedule?from_city=Paris&to_city=London&selected_date=2024-10-8T00:00:00.000Z
  test "should get travel_options and display them when there are some" do
    get travel_options_path(
      from_city: "Paris",
      to_city: "London",
      selected_date: "2024-10-8T00:00:00.000Z"
    )
    assert_response :success
    assert_select "h1#from-to", count: 1, text: "Paris - London"
    assert_select "h2#no-schedule", count: 0
    option_id = @controller.instance_variable_get(:@travel_options).first.id
    assert_select "div#travel-option-#{option_id}", count: 1
  end

  # http://localhost:3000/schedule?from_city=Moscow&to_city=Kiev&selected_date=2024-10-8T00:00:00.000Z
  test "should get travel_options and display a no schedule found when there are none" do
    get travel_options_path(
      from_city: "Moscow",
      to_city: "Kiev",
      selected_date: "2024-10-8T00:00:00.000Z"
    )
    assert_response :success
    assert_select "h1#from-to", count: 1, text: "Moscow - Kiev"
    assert_select "h2#no-schedule", count: 1, text: "Unfortunately, no travel options match your request. Please try other dates."
  end
end
