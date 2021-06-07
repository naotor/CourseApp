require "test_helper"

class AssignStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assign_students_index_url
    assert_response :success
  end
end
