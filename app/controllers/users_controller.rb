class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to books_path(@user)
  end

   # 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end



end
