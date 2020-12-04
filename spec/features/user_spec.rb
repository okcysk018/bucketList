require 'rails_helper'
require 'spec_helper'

feature 'user' do
  given!(:user) { create(:user) }
  given(:posts) { create_list(:post, 20) }

  context "ログインからログアウト" do
    background do
      posts.select{|post| post.id.odd? && post.id > 1 && post.id < 9}.sort{ |a, b| b.id <=> a.id }
    end

    scenario "ログイン画面からマイページ" do
      # ログイン画面でフォーム入力
      visit new_user_session_path
      fill_in 'Eメール', with: user.email
      fill_in 'パスワード', with: user.password
      find('#new_user').click_on 'ログイン'
      # マイページにリダイレクトされる
      expect(current_path).to eq user_path(user.id)
      # ログインメッセージ出力
      expect(page).to have_content 'ログインしました'
    end

    scenario "マイページからログアウト" do
      login_as(user, :scope => :user)
      visit user_path(user.id)
      find('.user-contents').click_on 'ログアウト'
      # トップページにリダイレクトされる
      expect(current_path).to eq root_path(posts)
      # ログアウトメッセージ出力
      expect(page).to have_content 'ログアウトしました'
    end
  end

end