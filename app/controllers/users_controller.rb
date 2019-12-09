class UsersController < ApplicationController

  before_action :authenticate_user! ,only: [:index, :show, :edit, :update]
  before_action :correct_user ,only: [:edit, :update]

  def index
    @users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def edit
    @user = User.find(current_user.id)

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your infomation update successfully."
       redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def correct_user
    @user = User.find(params[:id])
        if @user != current_user
          redirect_to user_path(current_user.id)
        end
  end
end