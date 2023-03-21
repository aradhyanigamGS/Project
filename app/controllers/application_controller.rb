class ApplicationController < ActionController::Base
#   byebug
     before_action :authenticate_register!


  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |register| register.permit(:name, :email, :role, :contact ,:password)}

            devise_parameter_sanitizer.permit(:account_update) { |register| register.permit(:name, :email, :role, :contact, :password, :current_password)}
       end

end
