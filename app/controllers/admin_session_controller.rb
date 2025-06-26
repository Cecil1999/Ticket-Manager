class AdminSessionController < ApplicationController
  before_action :admin_logged_in?, only: %i[ home ]

  def home
    if !admin_logged_in?
      redirect_to admin_new_path and return
    end
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

    if @user && @user.authenticate(params[:password]) && @user.admin?
      session[:logged_in_admin] = @user.username
      redirect_to admin_home_path and return
    else
      redirect_to admin_new_path and return
    end
  end

  private
  def admin_logged_in?
    defined?(session[:logged_in_admin])
  end

  def admin_params
    params.expect([ :username, :password ])
  end
end
