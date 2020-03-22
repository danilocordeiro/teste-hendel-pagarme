class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_member!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  PagarMe.api_key        = 'ak_test_YY4he2Aw0TeutG5avCi0mIObpGuR5n'
  PagarMe.encryption_key = 'ek_test_EjLrqWBzyFQW3tHjlBnZpQJRgcvjxe' # If needed

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
