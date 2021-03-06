class SessionsController < ApplicationController
  skip_before_action :require_sign_in!, only: %i[new create]

  def new; end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user.present? && @user.authenticate(session_params[:password])
      sign_in(@user)
      redirect_to root_path, notice: 'ログインしました'
    else
      flash.now[:alert] = t('.flash.invalid_password')
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

  private

  def session_params
    params.permit(:email, :password)
  end
end
