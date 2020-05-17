class PostsController < ApplicationController

  prepend_before_action :set_post, only: [:show, :edit, :destroy, :update]
  before_action :set_category_tags_to_gon, only: [:edit, :new]
  before_action :set_geocorder_to_gon, only: [:edit, :new]
  before_action :move_to_login, except: [:index, :show]
  before_action :move_to_show, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order("id DESC")
  end

  def new
    @post = Post.new
    @post.images.build
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to post_path(@post.id), notice: "投稿しました"
    else
      redirect_to new_post_path, alert: "投稿に失敗しました"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "更新しました"
    else
      redirect_to edit_post_path, alert: "更新に失敗しました"
    end
  end

  def destroy
    if @post.destroy
      redirect_to user_path(current_user.id), notice: "削除しました"
    else
      redirect_to post_path, alert: "削除に失敗しました"
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def map
    results = Geocoder.search(params[:address])
    @lating = results.first.coordinates

    respond_to do |format|
      format.js
    end
  end

  private
  def post_params
    params.require(:post).permit(
      :title,
      :address,
      :latitude,
      :longitude,
      :priority,
      :deadline,
      :budget,
      :description,
      :reputation,
      :done_flag,
      :private_flag,
      :category_list,
      images_attributes: [:id, :image, :_destroy]
      # images_attributes: [:id, {image: []}, :_destroy]
    ).merge(
      user_id: current_user.id
    );
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_category_tags_to_gon
    # TODO:多階層カテゴリの実現およびcssの編集
    # TODO:モデルに記述？
    gon.category_tags = Post.tag_counts_on(:categories).where('name LIKE(?) AND id <= ?', "#{params[:term]}%", 13).pluck(:name) #初期値カテゴリータグをtagsテーブルのnameカラム前方一致で取得
  end

  def set_geocorder_to_gon
    # gon.geocorder = Geocoder.search(params[:address]).first.coordinates
  end

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "ログインしてください"
    end
  end

  def move_to_show
    unless @post.user_id == current_user.id
      redirect_to post_path, alert: "不正なリクエストです"
    end
  end

end
