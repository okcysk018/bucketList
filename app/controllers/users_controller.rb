class UsersController < ApplicationController

  before_action :set_ransack

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("id DESC").includes(:user).page(params[:page]).without_count.per(15)
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

  def set_ransack
    @search = Post.ransack(params[:q])
  end

end
