module SessionsHelper
  def sign_out
    cookies.delete(:user_remember_token)
  end

  private

  def require_sign_in!
    redirect_to login_path unless signed_in?
  end
end
