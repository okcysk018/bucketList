module ApplicationHelper
  def current_user_has?(instance)
    user_signed_in? && current_user == instance.user
  end

  # def not_current_user_is?(instance)
  #   current_user != instance.user
  # end

end
