class UsersController < ApplicationController
    before_action :authenticate_user, only: [:show]

    def show
        @user = User.find(params[:id])
        @gossips = @user.gossips
    end

    def new
        @user = User.new
        @cities = City.all
    end
    
    def create
        @user = User.new() # avec xxx qui sont les données obtenues à partir du formulaire
        @user.first_name = params[:first_name]
        @user.last_name = params[:last_name]
        @user.age = params[:age]
        @user.email = params[:email]
        @user.city_id = params[:city]
        @user.description = params[:description]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]

        if @user.save # essaie de sauvegarder en base @user      
            log_in(@user)
            flash[:success  ] = 'Connexion et inscription réussis'
            redirect_to gossips_path
        else
            @cities = City.all
            flash.now[:danger] = 'Inscription non réussi'
            render :new
        end
    end
end