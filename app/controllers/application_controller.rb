class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :phone, :scheme, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :username, :email, :password, :remember_me]
    devise_parameter_sanitizer.permit :account_update, keys: [:username, :email, :phone, :scheme, :password, :password_confirmation, :current_password]
  end

  private

  def require_user_signed_in
    unless user_signed_in?
      redirect_to root_path, flash: { error: "You must be signed in to view this page." }
    end
  end

end
