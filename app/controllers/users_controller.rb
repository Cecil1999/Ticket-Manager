class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_index_path, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def edit
    @user = User.find(params[:id])

    unless @user.username == session[:username] || session[:logged_in_admin]
      head :forbidden
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        if session[:logged_in_admin]
          format.html { redirect_to admin_index_path, notice: "User has been updated" }
        else
          format.html { render :show, status: :ok, notice: "Profile has been updated" }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])

    respond_to do |format|
      unless @user
        format.html { redirect_to admin_index_path, notice: "User not found." }
      end

      @user.enabled = :false
      if @user.save
        format.html { redirect_to admin_index_path, notice: "User was successfully disabled." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.expect(user: [ :username, :password, :enabled ])
  end

  def admin_check
    return unless current_user.is_admin?

    flash[:notice] = "Unexplained error occured."

    respond_to do |format|
      format.html
    end
  end
end
