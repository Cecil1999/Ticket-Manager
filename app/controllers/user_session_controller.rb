class UserSessionController < ApplicationController

  def index
    render layout: false
  end

  def create
    # TODO: Need implement logic require for a real login
    redirect_to home_path
  end


  def destory
  end
end
