class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  before_action :is_loggedin

  def is_loggedin
    unless verify_session?
      redirect_to root_path
    end
  end

  def verify_session?
    !!session[:username]
  end

  allow_browser versions: :modern
end
