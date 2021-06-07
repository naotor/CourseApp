class Search::Course < Search::Base
  attribute :course_name, :string
  attribute :teacher_name, :string

  def matches
    @table = ::Course.arel_table

    results = ::Course.all
    results = results.where(contains(@table[:name], course_name)) \
      if course_name.present?
    # results = results.where(contains(@table[:teacher_name], teacher_name)) \
    #   if teacher_name.present?
    # results = Course.joins(:teacher).where(id: 1)
    results
  end
end