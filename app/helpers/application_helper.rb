module ApplicationHelper
  def link_to_current_user
    text = current_user.display_name.present? ? current_user.display_name : current_user.email
    link_to text, user_path(current_user), :class => 'display-name'
  end
end
