class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :current_user
  before_action :require_sign_in!
  before_action :signed_in?

  protect_from_forgery with: :exception

  def current_user
    remember_token = User.encrypt(cookies[:user_remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:user_remember_token] = remember_token
    user.update!(remember_token: User.encrypt(remember_token))
    @current_user = user
  end

  def signed_in?
    @current_user.present?
  end
end
