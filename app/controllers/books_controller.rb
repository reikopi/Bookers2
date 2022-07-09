class BooksController < ApplicationController

  def new
   @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created"
      redirect_to books_path
    else
      @books = Book.all
      render :index
    end
  end

  def index
   @books = Book.all
   @book = Book.new
   @user = current_user
  end

  def show
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to books_path(@book), method: :show
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


   # 投稿データのストロングパラメータ
  private

  def book_params
  params.require(:book).permit(:book_title, :caption, :profile_image)
  end

end
