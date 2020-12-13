require 'rails_helper'
require 'spec_helper'
include CheckFromValue
include InputFromValue
include CheckViewContent

feature 'post' do
  # NOTE: given関数で変数の共通化, テストデータ作成
  given!(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given(:posts) { create_list(:post, 20, user_id: user.id) }
  given!(:post_public) { create(:post, title: 'required_title', user_id: user.id) }
  # given(:params) { { user_id: user.id, post: attributes_for(:post) } }
  # given(:invalid_params) { { user_id: user.id, post: attributes_for(:post, title: nil, budget: nil, deadline: nil) } }
  given(:updated_post) { build(:post, title: 'updated_title', budget: 2000, deadline: '2020-01-01', description: 'updated description', reputation: 1, priority: 1) }
  given(:not_update_attributes) do { title: '', budget: -1 } end
  given(:post_all_contents) { build(:post, :with_address, :with_placeId, :with_reputation, :with_priority, :done_post, :with_description,:private_post, user_id: user.id) }

  # TODO:全項目入力してから必須項目以外をnilにする
  context "正常系" do
      background do
        posts.select{|post| post.id.odd? && post.id > 1 && post.id < 9}.sort{ |a, b| b.id <=> a.id }
      end

      context "投稿ユーザでログイン" do
        background do
          login_as(user, :scope => :user)
          visit user_path(user.id)
        end

          scenario "マイページから投稿画面に遷移後、必須項目を入力して投稿→編集→削除" do
            find('.user-contents').click_on '新規投稿'
            expect(current_path).to eq new_post_path

            check_required_no_value?
            check_form_no_value?
            expect(find_field('場　　所').value).to eq nil

            expect {
              input_required_value_for(post_public)
              click_on '登録する'

              expect(current_path).to eq post_path(Post.last)
              expect(page).to have_content '投稿しました'
              check_required_content_for(post_public)
            }.to change(user.posts, :count).by(1)

            click_on '編集'
            expect(current_path).to eq edit_post_path(Post.last)
            check_required_value_for(post_public)
            check_form_no_value?
            expect(page).to have_field '場　　所', with: nil

            expect {
              input_required_value_for(updated_post)
              click_on '更新する'

              expect(current_path).to eq post_path(Post.last)
              expect(page).to have_content '更新しました'
              check_required_content_for(updated_post)
            }.to change(user.posts, :count).by(0)

            expect {
              click_on '削除'
              expect(current_path).to eq user_path(user.id)
              expect(page).to have_content '削除しました'
              expect(page).to have_no_content updated_post.title
            }.to change(user.posts, :count).by(-1)

          end

          scenario "マイページ→編集画面に遷移して項目を編集→検索→マイページ→削除" do
            all('.post-data').last.click_on '編集'
            expect(current_path).to eq edit_post_path(post_public)

            check_required_value_for(post_public)
            check_form_no_value?
            expect(find_field('場　　所').value).to eq nil

            expect {
              input_required_value_for(post_all_contents)
              input_form_value_for(post_all_contents)
              click_on '更新する'

              expect(current_path).to eq post_path(post_public.id)
              expect(page).to have_content '更新しました'
              check_required_content_for(post_all_contents)
              expect(page).to have_content post_all_contents.description
            }.to change(user.posts, :count).by(0)

            fill_in 'search-keyword', with: post_all_contents.title
            find('.search-btn').click
            expect(current_path).to eq search_posts_path
            find('.card')
            check_search_first_content_for(post_all_contents)

            click_on 'card-img-link'
            expect(current_path).to eq post_path(post_public)

            expect {
              click_on '削除'
              expect(current_path).to eq user_path(user.id)
              expect(page).to have_content '削除しました'
              expect(page).to have_no_content post_all_contents.title
            }.to change(user.posts, :count).by(-1)
          end

          scenario "トップページ→投稿画面に遷移して項目を投稿→検索→マイページ→詳細→編集→マイページ→詳細→削除" do
            visit root_path
            click_on '新規投稿'
            expect(current_path).to eq new_post_path
            check_required_no_value?
            check_form_no_value?

            # 新規投稿画面で項目を入力し、登録
            expect {
              input_required_value_for(post_all_contents)
              input_form_value_for(post_all_contents)
              # TODO:driverでの実装、readonly除外でテスト可能
              # fill_in '場　　所', with: post_all_contents.address
              # fill_in 'place_id', with: post_all_contents.place_id
              # TODO:画像とタスクの最低と最高、カテゴリの既存と新規
              # check '非 公 開 に す る'
              check '達 成 済 に す る'
              click_on '登録する'

              expect(current_path).to eq post_path(Post.last)
              expect(page).to have_content '投稿しました'
              check_required_content_for(post_all_contents)
              check_show_content_for(post_all_contents)

              expect(page).to have_content '達成済'
            }.to change(Post, :count).by(1)

            # ヘッダーの検索ボタン押下
            find('.search-btn').click
            expect(current_path).to eq search_posts_path
            check_search_first_content_for(post_all_contents)
            expect(first('.card-body')).to have_content '達成済'
            expect(first('.card')).to have_selector '.sample-img'

            # 検索画面で投稿の投稿者リンクを押下
            first('.card-post-user-link').click
            expect(current_path).to eq user_path(user.id)
            check_required_content_for(post_all_contents)
            check_myPage_first_content_for(post_all_contents)
            expect(first('.post-data')).to have_selector '.sample-img'
            expect(first('.post-data')).to have_content '達成済'

            # マイページで投稿のタイトルリンクを押下
            click_on post_all_contents.title
            expect(current_path).to eq post_path(Post.last)

            # 詳細画面で投稿の編集ボタンを押下
            click_on '編集'
            expect(current_path).to eq edit_post_path(Post.last)
            check_required_value_for(post_all_contents)
            check_form_value_for(post_all_contents)
            expect(page).to have_unchecked_field('非 公 開 に す る')
            expect(page).to have_checked_field('達 成 済 に す る')

            # 投稿画面で項目を編集して更新ボタンを押下
            expect {
              input_required_value_for(updated_post)
              input_form_value_for(updated_post)
              check '非 公 開 に す る'
              uncheck '達 成 済 に す る'
              click_on '更新する'

              expect(current_path).to eq post_path(Post.last)
              expect(page).to have_content '更新しました'
              check_required_content_for(updated_post)
              check_show_content_for(updated_post)
              expect(page).to have_no_content '達成済'
              expect(page).to have_content '非公開'
            }.to change(user.posts, :count).by(0)

            # 検索フォームにユーザ名を入力してヘッダーの検索ボタン押下
            # FIXME:検索が機能していない
            fill_in 'search-keyword', with: updated_post.user.nickname
            find('.search-btn').click
            expect(current_path).to eq search_posts_path
            expect(page).to have_no_content updated_post.title

            click_on 'マイページ'
            expect(current_path).to eq user_path(user.id)
            check_required_content_for(updated_post)
            check_myPage_first_content_for(updated_post)
            expect(page).to have_no_content '達成済'
            expect(page).to have_content '非公開'

            first('.post-data').find('.image-link').click
            expect(current_path).to eq post_path(Post.last)

            expect {
              click_on '削除'
              expect(current_path).to eq user_path(user.id)
              expect(page).to have_content '削除しました'
              expect(page).to have_no_content post_all_contents.title
            }.to change(user.posts, :count).by(-1)
          end

          scenario '検索画面→新規投稿画面に遷移して全項目投稿→検索→マイページ→削除' do
            visit search_posts_path
            click_on '新規投稿'
            expect(current_path).to eq new_post_path
            check_required_no_value?
            check_form_no_value?

            expect {
              input_required_value_for(post_all_contents)
              input_form_value_for(post_all_contents)
              check '非 公 開 に す る'
              check '達 成 済 に す る'
              click_on '登録する'

              expect(current_path).to eq post_path(Post.last)
              expect(page).to have_content '投稿しました'
              check_required_content_for(post_all_contents)
              expect(page).to have_content '達成済'
              expect(page).to have_content '非公開'
            }.to change(user.posts, :count).by(1)

            # fill_in 'search-keyword', with: '東京'
            find('.search-btn').click
            expect(current_path).to eq search_posts_path
            expect(page).to have_no_content post_all_contents.title

            click_on 'マイページ'
            expect(current_path).to eq user_path(user.id)
            check_required_content_for(post_all_contents)
            check_myPage_first_content_for(post_all_contents)
            expect(page).to have_content '達成済'
            expect(page).to have_content '非公開'

            expect {
              first('.post-data').click_on '削除'
              expect(current_path).to eq user_path(user.id)
              expect(page).to have_content '削除しました'
              expect(page).to have_no_content post_all_contents.title
            }.to change(user.posts, :count).by(-1)
          end
      end
    end
  end