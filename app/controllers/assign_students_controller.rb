class AssignStudentsController < ApplicationController
  before_action :find_course

  def index
    @students = Student.all
  end

  private
  def find_course
    @course = Course.find(params[:course_id])
  end
end
