class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :set_cart
  before_action :authenticated?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def login?
    !!current_user
  end

  def authenticated?
    redirect_to new_user_session_path unless login?
  end
end
