class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
  end

  def show
  end

  def destory
  end

  private

  def user_params
    params.expect(user: [ :username, :password ])
  end
end
