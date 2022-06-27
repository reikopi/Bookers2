class BooksController < ApplicationController
  
  def new
    @books = Books.new
  end
  
  def create
    @books = Books.new(books_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to books_path
  end
  
  def index
  end

  def show
  end

  def edit
  end
  
  
   # 投稿データのストロングパラメータ
  private

  def books_params
    params.require(:books).permit(:title, :body)
  end
  
end
