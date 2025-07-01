class UserSessionController < ApplicationController
  layout "default"
  skip_before_action :is_loggedin

  def index
    if session[:username]
      redirect_to home_path
    end
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:username] = @user.username
      redirect_to home_path and return
    else
      redirect_to root_path and return
    end
  end

  def destory
    session.delete(:username)
    session.delete(:admin_logged_in)
    redirect_to root_path
  end

  private
  def user_session_params
    params.expect(user: [ :username, :password ])
  end
end
