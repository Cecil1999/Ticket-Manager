class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :is_loggedin
  helper_method :is_admin?

  def is_loggedin
    unless verify_session?
      redirect_to root_path
    end
  end

  def verify_session?
    !!session[:username]
  end

  def is_admin?
    User.find_by(username: session[:username]).admin?
  end

  allow_browser versions: :modern
end
