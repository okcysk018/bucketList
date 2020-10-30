# spec/models/モデル_spec
require 'rails_helper'
describe PostsController do
  # NOTE: let関数で変数の共通化, テストデータ作成
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:posts) { create_list(:post, 7).select {|post| post.id.odd? && post.id > 1} }
  let(:post) { create(:post, user_id: user.id) }

  describe 'GET #index' do
    context 'ログイン済' do
      before do
        login user
        get :index, params: {id: posts}
      end

      it "@postsの値のチェック" do
        expect(assigns(:posts)).to match(posts.sort{ |a, b| b.id <=> a.id })
      end

      it "トップ画面に遷移" do
        expect(response).to render_template :index
      end
    end

    context '未ログイン' do
      before do
        get :index, params: {id: posts}
      end

      it "@postsの値のチェック" do
        expect(assigns(:posts)).to match(posts.sort{ |a, b| b.id <=> a.id })
      end

      it "トップ画面に遷移" do
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #new' do
    context 'ログイン済' do
      before do
        login user
        get :new
      end

      it '@postが新規作成されること' do
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "新規投稿画面に遷移" do
        expect(response).to render_template :new
      end
    end

    context '未ログイン' do
      before do
        get :new
      end

      it "ログイン画面に遷移" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context '投稿ユーザでログイン済' do
      before do
        login user
        get :edit, params: { id: post, user_id: user.id } # 作成したテストデータのidからインスタンス変数を生成
      end

      it "@postの値のチェック" do
        expect(assigns(:post)).to eq post # テストデータとインスタンス変数の比較
      end

      it "編集画面に遷移" do
        expect(response).to render_template :edit
      end
    end

    context '別ユーザでログイン済' do
      before do
        login other_user
        get :edit, params: { id: post, user_id: other_user.id }
      end

      it "@postの値のチェック" do
        pending 'インスタンス変数とテストデータが同一になってしまう'
        expect(assigns(:post)).not_to eq post # テストデータとインスタンス変数の比較
      end

      it "投稿詳細画面に遷移" do
        expect(response).to redirect_to(post_path)
      end
    end

    context '未ログイン' do
      before do
        get :edit, params: { id: post }   # 作成したテストデータのidからインスタンス変数を生成
      end

      it "ログイン画面に遷移" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end