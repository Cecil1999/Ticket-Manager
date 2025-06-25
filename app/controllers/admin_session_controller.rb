class AdminSessionController < ApplicationController
  def home
  end

  def new
    if !is_admin?
      head :forbidden
    end
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user.username != session[:username]
      head :forbidden
    end

    if @user && @user.authenticate(password: params[:password])&.is_admin?
      session[:logged_in_admin] = @user.username
      redirect_to admin_home and return
    else

    end
  end
end
