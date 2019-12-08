class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  # ログイン後rootでなくuesrs_pathに飛びたい
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
end