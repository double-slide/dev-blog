class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new
        if @user.save
            redirect_to root_path, notice: 'Successfully registered!'
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end