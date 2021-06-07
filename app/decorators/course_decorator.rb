class CourseDecorator < Draper::Decorator
  delegate_all

  def display_name
    "# %03d #{name}" % id
  end
end
