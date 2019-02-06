class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @gossips = @user.gossips
    end
end