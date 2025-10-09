module Admin
    class UsersController < ApplicationController
        before_action :set_user, only: %i[ edit ]

        def destroy
            @user = User.find(params[:id])
            @user.enabled = :false
            if @user.save
                flash[:notice] = "Account was successfully disabled."
            else
                flash[:notice] = "Account was not able to be disabled"
            end
            redirect_to admin_index_path
        end

        def edit
        end

        def update
            @user = User.find(params[:id])

            if @user.admin_update(@user, update_params)
                flash[:notice] = "Account was sucessfully edited."
            else
                respond_with @user, edit_user_registration(@path)
            end

            redirect_to admin_index_path
        end

        private
        def set_user
            @user = User.find(params[:id])
        end

        def update_params
            permitted = [ :email, :username, :enabled, :admin ]
            if params[ :change_password_cb ] #
                permitted += [ :password, :password_confirmation ]
            end
            params.require(:user).permit(permitted)
        end

        def admin_check
            return if current_user.is_admin?

            flash[:notice] = "Unexplained error occured."

            redirect_to root_path
        end
    end
end