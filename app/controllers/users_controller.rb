class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("id DESC")
  end

  # TODO:ユーザ情報編集
  # def edit
  # end

  # def update
  #   if current_user.update(user_params)
  #     redirect_to root_path
  #   else
  #     render :edit
  #   end
  # end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
