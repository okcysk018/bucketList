class UsersController < ApplicationController
  prepend_before_action :set_user, only: [:show]
  # before_action :set_category_tags_to_gon

  def show
    sort = params[:sort] || "id DESC"

    # @categories = gon.category_tags

    # sort = params[:sort] || "id DESC"
    # if params[:tag_name]
    #   @posts = @user.posts.order(sort).tagged_with("#{params[:tag_name]}").includes(:images).page(params[:page]).without_count.per(15)

    # TODO: 無限スクロールだとindex振れないため
    # @posts = @user.posts.order(sort).includes(:images).page(params[:page]).without_count.per(15)
    # FIXME:sortに値が入らない
    @posts = @user.posts.order(sort).includes(:images)
    gon.done_flag_count = [@posts.where('done_flag = 0').count, @posts.where('done_flag = 1').count]
    # else
    #   @posts = @user.posts.order(sort).includes(:images).page(params[:page]).without_count.per(15)
    # end
  end

  # TODO: ユーザ情報編集
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
    params.require(:user).permit(:nickname, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_category_tags_to_gon
    # TODO: 多階層カテゴリの実現およびcssの編集
    # TODO:モデルに記述？
    gon.category_tags = Post.tag_counts_on(:categories).where('name LIKE(?) AND id <= ?', "#{params[:term]}%", 13).pluck(:name) # 初期値カテゴリータグをtagsテーブルのnameカラム前方一致で取得
  end
end
