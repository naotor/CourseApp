class PlanDecorator < ApplicationDecorator
  delegate_all

  def display_title(i)
    h.content_tag :b, "#%03d #{title}" % (i+1)
  end

  def display_body
    h.simple_format(body)
  end
end
