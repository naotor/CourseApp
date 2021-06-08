class PlanDecorator < ApplicationDecorator
  delegate_all

  def display_title
    h.content_tag :b, title
  end

  def display_body
    h.simple_format body
  end
end
