class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    # permit extra attributes on sign up and account update through devise
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_up_path_for(resource) 
    flash[:notice] = "Successfully logged in"
    if resource.role == 'admin'
      admin_dashboard_path
    else
      puts "Redirecting to home index"
      home_index_path
    end
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = "Successfully logged in"
    if resource.role == 'admin'
      admin_dashboard_path
    else
      puts "Redirecting to home index"
      home_index_path
    end 
  end

end
