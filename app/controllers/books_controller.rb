class BooksController < ApplicationController

  def new
   @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
   @book = Book.all
   @user = current_user
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to books_path(@book), method: :show
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title,:caption)
  end

end
