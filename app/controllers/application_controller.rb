class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :current_user
  before_action :require_sign_in!
  before_action :signed_in?

  protect_from_forgery with: :exception
end
