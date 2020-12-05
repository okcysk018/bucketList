require 'rails_helper'
require 'spec_helper'

feature 'post' do
  # NOTE: given関数で変数の共通化, テストデータ作成
  given!(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given(:posts) { create_list(:post, 20) }
  given!(:post_public) { create(:post, user_id: user.id) }
  given(:params) { { user_id: user.id, post: attributes_for(:post) } }
  given(:invalid_params) { { user_id: user.id, post: attributes_for(:post, title: nil, budget: nil, deadline: nil) } }
  given(:update_attributes) do { title: 'updated_title', budget: 2000 } end
  given(:not_update_attributes) do { title: '', budget: -1 } end
  given(:post_all_contents) { build(:post, :with_address, :with_placeId, :with_reputation, :with_priority, :done_post, :with_description,:private_post, user_id: user.id) }

    context "正常系" do
      background do
        posts.select{|post| post.id.odd? && post.id > 1 && post.id < 9}.sort{ |a, b| b.id <=> a.id }
      end

      context "ログイン状態の場合" do
        background do
          login_as(user, :scope => :user)
          visit user_path(user.id)
        end

        context "マイページで投稿・編集・削除" do
          scenario "マイページから新規投稿画面に遷移して投稿→編集→削除" do
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

            expect {
              click_on '編集'

              expect(current_path).to eq edit_post_path(Post.last)
              fill_in 'タスクタイトル', with: update_attributes[:title]
              fill_in '予　　算', with: update_attributes[:budget]
              click_on '更新する'

              expect(current_path).to eq post_path(Post.last)
              expect(page).to have_content '更新しました'
              expect(page).to have_content "#{update_attributes[:title]}"
              expect(page).to have_content "#{update_attributes[:budget].to_s(:delimited)}"
            }.to change(user.posts, :count).by(0)

            expect {
              click_on '削除'
              expect(current_path).to eq user_path(user.id)
              expect(page).to have_content '削除しました'
            }.to change(user.posts, :count).by(-1)

          end

          scenario "マイページから投稿編集画面に遷移して更新→マイページ→詳細→削除" do
            expect {
              find('.post-data').click_on '編集'

              fill_in 'タスクタイトル', with: post_all_contents.title
              fill_in 'タスク詳細', with: post_all_contents.description
              select '2020', from: 'post_deadline_1i'
              select '1', from: 'post_deadline_2i'
              select '1', from: 'post_deadline_3i'
              fill_in '予　　算', with: post_all_contents.budget
              select "#{post_all_contents.priority}", from: 'post_priority'
              check '非 公 開 に す る'
              check '達 成 済 に す る'
              select "#{post_all_contents.reputation}", from: 'post_reputation'
              click_on '更新する'

              expect(current_path).to eq post_path(post_public.id)
              expect(page).to have_content '更新しました'
              expect(page).to have_content post_all_contents.title
              expect(page).to have_content "#{post_all_contents.budget.to_s(:delimited)}"
              expect(page).to have_content '達成済'
              expect(page).to have_content '非公開'
              expect(page).to have_content post_all_contents.description
            }.to change(user.posts, :count).by(0)

            click_on 'マイページ'
            expect(current_path).to eq user_path(user.id)
            expect(page).to have_content post_all_contents.title
            expect(page).to have_content "#{post_all_contents.budget.to_s(:delimited)}"
            expect(page).to have_content '達成済'
            expect(page).to have_content '非公開'
            # TODO:画像がnoImageか確認
            click_on post_all_contents.title
            expect(current_path).to eq post_path(post_public)

            expect {
              click_on '削除'
              expect(current_path).to eq user_path(user.id)
              expect(page).to have_content '削除しました'
            }.to change(user.posts, :count).by(-1)
          end

          scenario "マイページから投稿を削除" do
            expect(page).to have_selector '.post-data'
            expect {
              find('.post-data').click_on '削除'
              expect(current_path).to eq user_path(user.id)
              expect(page).to have_content '削除しました'
            }.to change(user.posts, :count).by(-1)
            expect(page).to have_no_selector '.post-data'
          end
        end

        context "トップページで投稿・検索" do
          scenario "トップから新規投稿画面に遷移で投稿→検索" do
            visit root_path
            click_on '新規投稿'
            expect(current_path).to eq new_post_path

            expect {
              fill_in 'タスクタイトル', with: post_all_contents.title
              fill_in 'タスク詳細', with: post_all_contents.description
              select '2020', from: 'post_deadline_1i'
              select '1', from: 'post_deadline_2i'
              select '1', from: 'post_deadline_3i'
              fill_in '予　　算', with: post_all_contents.budget
              # TODO:driverでの実装、readonly除外でテスト可能
              # fill_in '場　　所', with: post_all_contents.address
              # fill_in 'place_id', with: post_all_contents.place_id
              # TODO:画像とタスクの最低と最高、カテゴリの既存と新規
              select "#{post_all_contents.priority}", from: 'post_priority'
              # check '非 公 開 に す る'
              check '達 成 済 に す る'
              select "#{post_all_contents.reputation}", from: 'post_reputation'
              click_on '登録する'

              expect(current_path).to eq post_path(Post.last)
              expect(page).to have_content '投稿しました'
            }.to change(Post, :count).by(1)

            expect(page).to have_selector '.search-btn'
            find('.search-btn').click
            expect(current_path).to eq search_posts_path
            expect(page).to have_content post_all_contents.title


          end

        end
      end
    end
  end