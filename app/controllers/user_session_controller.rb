class UserSessionController < ApplicationController
  def index
    render layout: false
  end

  def create
    @user = User.find_by(username: params.extract_value(:username))&.authenticate(params.extract_value(:password))

    @user.inspect
    # TODO: Need implement logic require for a real login
    redirect_to home_path
  end

  def destory
    redirect_to root_path
  end

  private
  def user_session_params
    params.expect(user: [ :username, :password ])
  end
end
