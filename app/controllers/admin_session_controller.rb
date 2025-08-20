class AdminSessionController < ApplicationController
  layout "default", only: %i[ new ]

  def index
    if !admin_logged_in?
      redirect_to admin_new_path and return
    end

    @users        = User.all
    @tickets      = Ticket.all
    @ticket_types = TicketType.order(:type_name)
    @ticket_types_hash = @ticket_types.map { |type| [ type.id, type.type_name ] }.to_h
  end

  def new
    if !current_user.is_admin?
      head :forbidden
    end
  end

  def create
    @user = User.find_by(username: params[:username])

    respond_to do |format|
      if @user && @user.authenticate(params[:password]) && @user.admin? && @user.username == session[:username]
        session[:logged_in_admin] = @user.username
        format.html { redirect_to admin_index_path, notice: "Hello, #{session[:logged_in_admin]}." }
        format.json { render :index, status: :created }
      else
        # TODO Perhaps log this..?
        format.html { redirect_to admin_new_path, notice: "Something went wrong, contract the admin team for help troubleshooting." }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
