class CourseDecorator < Draper::Decorator
  delegate_all

  def display_name
    h.content_tag :b, "# %03d #{name}" % id
  end

  def display_genres
    genres.map do |genre|
      h.content_tag :span, genre.name, class: 'label label-info'
    end.join(" ").html_safe
  end
end
