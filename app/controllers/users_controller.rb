class UsersController < ApplicationController
  def show
    @user =　User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_path(@user), method: :show
  end
  
end
