require "test_helper"

class SearchCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get search_courses_show_url
    assert_response :success
  end
end
