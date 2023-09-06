class ApplicationController < ActionController::Base
	before_action :authenticate_login!
	before_action :configure_permitted_parameters, if: :devise_controller?
  

  def after_sign_in_path_for(login)
    if current_login.role == 'admin'
      root_path
    elsif current_login.role == 'user'
      students_path
    else
      root_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

end
