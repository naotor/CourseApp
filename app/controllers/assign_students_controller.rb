class AssignStudentsController < ApplicationController
  before_action :set_course
  before_action :set_assign_student, only: %i(update destroy)

  def index
    @students = Student.preload(:gender).map do |student|
      if AssignStudent.find_by(course_id: @course.id, student_id: student.id)
        student.assign = true
      end
      student
    end
  end

  def update
    if @assign_student.new_record?
      @assign_student.save
    end
    redirect_to course_assign_students_path(@course)
  end

  def destroy
    unless @assign_student.new_record?
      @assign_student.destroy
    end
    redirect_to course_assign_students_path(@course)
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_assign_student
    @assign_student = AssignStudent.find_or_initialize_by(
      course_id: params[:course_id],
      student_id: params[:id],
    )
  end
end
