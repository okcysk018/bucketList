# spec/models/モデル_spec
require 'rails_helper'
describe PostsController do
  # NOTE: let関数で変数の共通化, テストデータ作成
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:posts) { create_list(:post, 20) }
  let!(:post_public) { create(:post, user_id: user.id) }
  let(:post_private) { create(:post, :private_post, user_id: user.id) }
  let(:params) { { user_id: user.id, post: attributes_for(:post) } }
  let(:invalid_params) { { user_id: user.id, post: attributes_for(:post, title: nil, budget: nil, deadline: nil) } }
  let(:update_attributes) do { title: 'updated_title', budget: 2000 } end
  let(:not_update_attributes) do { title: '', budget: -1 } end

  describe 'GET #index' do
    before do
      get :index, params: {id: posts}
    end

    it "テストデータが@postsと同値" do
      expect(assigns(:posts)).to match(posts.select{|post| post.id.odd? && post.id > 1 && post.id < 9}.sort{ |a, b| b.id <=> a.id })
    end

    it "トップ画面に遷移" do
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    context 'ログイン済の状態' do
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

    context '未ログインの状態' do
      before do
        get :new
      end

      it "ログイン画面に遷移" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context '投稿ユーザでログイン済' do
      before do
        login user
      end

      context '公開設定の投稿にリクエスト' do
        before do
          get :show, params: { id: post_public } # 作成したテストデータのidからインスタンス変数を生成
        end

        it "@postの値のチェック" do
          expect(assigns(:post)).to eq post_public # テストデータとインスタンス変数の比較
        end

        it "投稿詳細画面に遷移" do
          expect(response).to render_template :show
        end
      end

      context '非公開の投稿にリクエスト' do
        before do
          get :show, params: { id: post_private }
        end

        it "@postの値のチェック" do
          expect(assigns(:post)).to eq post_private
        end

        it "投稿詳細画面に遷移" do
          expect(response).to render_template :show
        end
      end
    end


    context '別ユーザでログイン済' do
      before do
        login other_user
      end

      context '公開設定の投稿へリクエスト' do
        it "投稿詳細画面に遷移" do
          get :show, params: { id: post_public }
          expect(response).to render_template :show
        end
      end

      context '非公開の投稿へリクエスト' do
        it "検索画面に遷移" do
          get :show, params: { id: post_private }
          expect(response).to redirect_to(search_posts_path)
        end
      end
    end


    context '未ログイン' do
      context '公開設定の投稿へリクエスト' do
        it "投稿詳細画面に遷移" do
          get :show, params: { id: post_public }
          expect(response).to render_template :show
        end
      end

      context '非公開投稿へリクエスト' do
        it "検索画面に遷移" do
          get :show, params: { id: post_private }
          expect(response).to redirect_to(search_posts_path)
        end
      end
    end

  end

  describe 'GET #edit' do
    context '投稿ユーザでログイン済' do
      before do
        login user
      end

      context '公開設定の投稿へリクエスト' do
        before do
          get :edit, params: { id: post_public }
        end

        it "@postの値のチェック" do
          expect(assigns(:post)).to eq post_public # テストデータとインスタンス変数の比較
        end

        it "編集画面に遷移" do
          expect(response).to render_template :edit
        end
      end

      context '非公開投稿へリクエスト' do
        before do
          get :edit, params: { id: post_private } # 作成したテストデータのidからインスタンス変数を生成
        end

        it "@postの値のチェック" do
          expect(assigns(:post)).to eq post_private
        end

        it "編集画面に遷移" do
          expect(response).to render_template :edit
        end
      end
    end


    context '別ユーザでログイン' do
      before do
        login other_user
      end

      context '公開設定の投稿へリクエスト' do
        before do
          get :edit, params: { id: post_public }
        end

        # HACK: 不要かも
        xit "@postの値のチェック" do
          expect(assigns(:post)).not_to eq post_public
        end

        it "投稿詳細画面に遷移" do
          expect(response).to redirect_to(post_path)
        end
      end

      context '非公開投稿へリクエスト' do
        before do
          get :edit, params: { id: post_private }
        end

        it "検索画面に遷移" do
          expect(response).to redirect_to(search_posts_path)
        end
      end
    end

    context '未ログイン' do
      context '公開設定の投稿' do
        it "ログイン画面に遷移" do
          get :edit, params: { id: post_public }
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      context '非公開投稿' do
        it "検索画面に遷移" do
          get :edit, params: { id: post_private }
          expect(response).to redirect_to(search_posts_path)
        end
      end
    end

  end

  describe 'GET #search' do
    before do
      get :search, params: {id: posts, page: 1}
    end

    it "@postsの値のチェック" do
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.id <=> a.id }.slice(0, 15))
    end

    it "検索画面に遷移" do
      expect(response).to render_template :search
    end
  end

  describe 'POST #create' do
    context 'ログイン済' do
      before do
        login user
      end

      context '投稿保存成功確認' do
        subject {
          post :create,
          params: params
        }

        it "postの値の保存チェック" do
          expect{ subject }.to change(Post, :count).by(1)
        end

        it "投稿詳細画面に遷移" do
          subject
          expect( response ).to redirect_to post_path(Post.last)
        end
      end

      context '投稿保存失敗確認' do
        subject {
          post :create,
          params: invalid_params
        }

        it "postの値の保存不可チェック" do
          expect{subject}.not_to change(Post, :count)
        end

        it "新規投稿画面に遷移" do
          subject
          # REVIEW: 意図したテストになっているか
          # CHANGED:expect(response).to redirect_to new_post_path
          expect(response).to render_template :new
        end
      end

    end

    context '未ログイン' do
      it "ログイン画面に遷移" do
        post :create, params: params
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'PATCH #update' do
    context '投稿ユーザログイン済' do
      before do
        login user
      end

      context '投稿が存在する場合' do
        context '更新成功' do
          subject {
            patch :update,
            params: {id: post_public.id, post: update_attributes},
            session: {}
          }

          it 'DBテーブル更新確認' do
            expect{ subject }.to change(Post, :count).by(0)
          end

          it 'DB更新' do
            subject
            post_public.reload
            expect(post_public.title).to eq update_attributes[:title]
            expect(post_public.budget).to eq update_attributes[:budget]
          end

          it '詳細画面遷移' do
            subject
            expect(response).to redirect_to(post_path(post_public))
          end
        end

        context '更新失敗' do
          subject {
            patch :update,
            params: {id: post_public.id, post: not_update_attributes},
            session: {}
          }

          it 'DBテーブル更新確認' do
            expect{ subject }.not_to change(Post, :count)
          end

          it 'DB更新不可' do
            subject
            post_public.reload
            expect(post_public.title).not_to eq update_attributes[:title]
            expect(post_public.budget).not_to eq update_attributes[:budget]
          end

          it '編集画面遷移' do
            subject
            # CHANGED:expect(response).to redirect_to(edit_post_path)
            expect(response).to render_template :edit
          end
        end
      end

      context '投稿が存在しない場合' do
        before do
          delete :destroy, params: {id: post_public.id}
        end

        subject {
          patch :update,
          params: {id: post_public.id}
        }

        it 'エラーになる' do
          expect { subject }.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
    end

    context '別ユーザログイン済' do
      it '投稿詳細画面遷移' do
        login other_user
        patch :update, params: {id: post_public.id, post: update_attributes}
        expect(response).to redirect_to post_path
      end
    end

    context '未ログイン' do
      it 'ログイン画面遷移' do
        patch :update, params: {id: post_public.id, post: update_attributes}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'DELETE #destroy' do
    context '投稿ユーザログイン済' do
      before do
        login user
      end

      context '投稿が存在する場合' do
        context '削除成功' do
          subject {
            delete :destroy,
            params: {id: post_public.id}
          }

          it 'DBテーブル削除確認' do
            expect{ subject }.to change(Post, :count).by(-1)
          end

          it 'ユーザマイページ画面遷移' do
            subject
            expect(response).to redirect_to(user_path(user.id))
          end
        end

        # FIXME: 失敗するケースのモック作成
        xcontext '削除失敗' do
          subject {
            delete :destroy,
            params: {id: post_public.id}
          }

          it 'DBテーブル削除確認' do
            expect{ subject }.not_to change(Post, :count)
          end

          it '投稿詳細画面遷移' do
            subject
            expect(response).to redirect_to(post_path)
          end
        end
      end

      context '投稿が存在しない場合' do
        before do
          delete :destroy, params: {id: post_public.id}
        end

        subject {
          delete :destroy,
          params: {id: post_public.id}
        }

        it 'エラーになる' do
          expect { subject }.to raise_exception(ActiveRecord::RecordNotFound)
        end
      end
    end

    context '別ユーザログイン済' do
      it '投稿詳細画面遷移' do
        login other_user
        delete :destroy, params: {id: post_public.id}
        expect(response).to redirect_to post_path
      end
    end

    context '未ログイン' do
      it 'ログイン画面遷移' do
        delete :destroy, params: {id: post_public.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end