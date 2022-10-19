module ActionCardHelper
  def render_action_card(icon, title, body, link = '#')
    render partial: "shared/action_card", locals: {icon: icon, title: title, body: body}
  end
end
