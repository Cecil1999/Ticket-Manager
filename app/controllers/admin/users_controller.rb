module Admin
    class UsersController < ApplicationController
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
    end
end