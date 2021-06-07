class Search::Course < Search::Base
  attribute :course_name, :string
  attribute :teacher_name, :string

  def matches
    results = Course
      .joins(:teacher).preload(:teacher)
    results = results.where(
      contains(Course.arel_table[:name], course_name)
    ) if course_name.present?
    results = results.where(
      contains(Teacher.arel_table[:name], teacher_name)
    ) if teacher_name.present?
    results
  end
end
