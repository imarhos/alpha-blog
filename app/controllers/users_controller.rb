class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        # render json: params
        # debugger
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to the alpha-blog #{@user.username}"
            redirect_to articles_path
        else #invalid user
            render 'new'
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end