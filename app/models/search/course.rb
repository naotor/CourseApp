class Search::Course < Search::Base
  attribute :course_name, :string
  attribute :teacher_name, :string
  attribute :student_name, :string
  attribute :level_id, :integer
  attribute :genre_ids, array: :integer

  def matches
    results = Course.all
    results = results.where(
      contains(Course.arel_table[:name], course_name)
    ) if course_name.present?
    results = results.joins(:teacher).where(
      contains(Teacher.arel_table[:name], teacher_name)
    ) if teacher_name.present?
    results = results.joins(:students).where(
      contains(Student.arel_table[:name], student_name)
    ) if student_name.present?
    results = results.where(
      level_id: level_id
    ) if level_id.present?
    results = results.joins(:genres).where(
      AssignGenre.arel_table[:genre_id].in(genre_ids)
    ) if genre_ids.reject(&:blank?).present?
    results
  end
end
