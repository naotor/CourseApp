class CoursesController < ApplicationController

  def index
    @courses = Course
      .preload(:students)
      .preload(:teacher)
      .preload(:level)
      .preload(:genres)
      .decorate
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to courses_path
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private
  def course_params
    params
      .require(:course)
      .permit(%i(
        name
        teacher_id
        level_id
      ) + [
        genre_ids: []
      ])
  end
end
