class AdminSessionController < ApplicationController
  layout "default", only: %i[ new ]
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

    unless @user
      # TODO Perhaps log this..?
      redirect_to admin_new_path and return
    end

    if @user.username != session[:username]
      # TODO Perhaps log this..?
      head :forbidden
    end

    if @user && @user.authenticate(params[:password]) && @user.admin?
      session[:logged_in_admin] = @user.username
      redirect_to admin_index_path and return
    else
      # TODO Perhaps log this..?
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
