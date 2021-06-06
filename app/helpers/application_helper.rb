module ApplicationHelper
  def navlink(title, path, current_controller, current_actions)
    status = \
      controller_name == current_controller.to_s && \
      current_actions.include?(action_name.to_sym) ? \
      "active" : ""

    content_tag :li, class: status do
      link_to title, path
    end
  end
end
