class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_ransack

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def set_ransack
    # NOTE:paramsの値を変更するとキーワードを認識できない
    query = { title_or_address_or_user_nickname_cont: params[:q] }
    @q = Post.ransack(query)
  end
end
