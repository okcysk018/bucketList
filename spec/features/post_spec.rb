require 'rails_helper'
require 'spec_helper'

feature 'post' do
  # NOTE: given関数で変数の共通化, テストデータ作成
  given!(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given(:posts) { create_list(:post, 20) }
  given!(:post_public) { create(:post, user_id: user.id) }
  given(:post_private) { create(:post, :private_post, user_id: user.id) }
  given(:params) { { user_id: user.id, post: attributes_for(:post) } }
  given(:invalid_params) { { user_id: user.id, post: attributes_for(:post, title: nil, budget: nil, deadline: nil) } }
  given(:update_attributes) do { title: 'updated_title', budget: 2000 } end
  given(:not_update_attributes) do { title: '', budget: -1 } end

    context "ログイン状態の場合" do
      background do
        login_as(user, :scope => :user)
        visit user_path(user.id)
      end

      scenario "マイページから新規投稿画面で投稿" do
        expect {
          find('.user-contents').click_on '新規投稿'
          expect(current_path).to eq new_post_path

          fill_in 'タスクタイトル', with: post_public.title
          select '2020', from: 'post_deadline_1i'
          select '1', from: 'post_deadline_2i'
          select '1', from: 'post_deadline_3i'
          fill_in '予　　算', with: post_public.budget
          click_on '登録する'

          expect(current_path).to eq post_path(Post.last)
          expect(page).to have_content '投稿しました'
        }.to change(user.posts, :count).by(1)
      end

      scenario "マイページから投稿編集画面で更新" do
        expect {
          find('.post-data').click_on '編集'

          expect(current_path).to eq edit_post_path(post_public.id)
          fill_in 'タスクタイトル', with: update_attributes[:title]
          fill_in '予　　算', with: update_attributes[:budget]
          click_on '更新する'

          expect(current_path).to eq post_path(post_public.id)
          expect(page).to have_content '更新しました'
          expect(page).to have_content "#{update_attributes[:title]}"
          expect(page).to have_content "#{update_attributes[:budget].to_s(:delimited)}"
        }.to change(user.posts, :count).by(0)
      end

      scenario "マイページから投稿を削除" do
        expect {
          find('.post-data').click_on '削除'
          expect(current_path).to eq user_path(user.id)
          expect(page).to have_content '削除しました'
        }.to change(user.posts, :count).by(-1)
      end
    end
  end