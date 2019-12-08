class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
      @books = Book.all
      @book = Book.new
  end

  def create
    @books = Book.all
    @user = User.find(current_user.id)
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
         flash[:notice] = "Your book save successfully"
         redirect_to book_path(@book.id)
      else
        render action: :index
      end
  end

  def index
      @books = Book.all
      @book = Book.new

  end

  def show
      @book = Book.find(params[:id])
      @books = Book.all
      @book = Book.new

  end


  def edit
      @books = Book.find(params[:id])
          if @book.user != current_user
             redirect_to books_path
          end
  end
  def update
    @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "Your book update successfully"
        redirect_to book_path(@book.id)
      else
        render action: :edit
      end
  end



  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to new_book_path
      flash[:notice] = "Book was successfully destroyed"
  end

  def userinfo
      @book = Book.new
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body, :user_id)
  end
end