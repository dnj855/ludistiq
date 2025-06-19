require "test_helper"

class PlanningsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get plannings_show_url
    assert_response :success
  end
end
