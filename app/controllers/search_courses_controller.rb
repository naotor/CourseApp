class SearchCoursesController < ApplicationController

  def index
    @course = Search::Course.new(search_course_params)
    @courses = @course
      .matches
      .decorate
  end

  def new
    @course = Search::Course.new
  end

  private
  def search_course_params
    params
      .require(:search_course)
      .permit(%i(
        course_name
        teacher_name
        student_name
        level_id
      ) + [
        genre_ids: []
      ])
  end
end
