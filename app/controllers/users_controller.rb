class UsersController < ApplicationController
    def index
        #@user1 = User.find(1)
        #@user2 = User.find(2)
        #@user3 = User.find(3)
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end
    
    def create
        user = User.new(user_params)
        user.save
       # redirect_to root_path #トップページに戻る
       redirect_to users_path
        
    end  
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        user = User.find(params[:id])
        user.update_attributes(user_params)
        redirect_to user_path
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to root_path
    end
    
private
    def user_params
        params.require(:user).permit(:name, :email, :profile)
    end


end
