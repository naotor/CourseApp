require "test_helper"

class TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    Rails.application.load_seed

    @teacher = Teacher.first
  end

  test "should get index" do
    get teachers_path
    assert_response :success
  end

  test "should get show" do
    get teacher_path(@teacher)
    assert_response :success
  end

  test "should get new" do
    get new_teacher_path
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_path(@teacher)
    assert_response :success
  end
end