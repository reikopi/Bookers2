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
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to books_path(@user)
    else
      render :edit
    end
  end

   # 投稿データのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end



end
