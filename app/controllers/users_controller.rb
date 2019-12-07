class UsersController < ApplicationController

    def index
    	@users = User.all
    	@book = Book.new
    end

    def show
    	@user = User.find
    	@book = Book.new
    end


    def edit
    	@user = USer.find(params[:id])
    end

    def update
    	@user = User.find(params[:id])
    	@user.update(user.params)
    	redirect_to user_path(@user)
    end
private

    def user_params
        params.require(:user).permit(:name, :introduction, :image)
    end
end
