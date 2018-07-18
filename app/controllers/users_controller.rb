class UsersController < ApplicationController

    def new
    end

    def create
        user = User.new(user_params)
        if user.save 
            session[:user_id] = user_id
            redirect to '/'
        else 
            redirect to '/signup/'
        end
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end

end