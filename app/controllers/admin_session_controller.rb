class AdminSessionController < ApplicationController
  def home
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user&.@user.authenticate(password: params[:password])&.is_admin?

    else

    end

  end
end
