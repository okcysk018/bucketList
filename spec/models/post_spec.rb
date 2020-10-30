# spec/models/モデル_spec
require 'rails_helper'
describe Post do
  describe '#create' do
    context '正常系' do
      it "最小限入力項目登録チェック" do
        expect(build(:post)).to be_valid
      end

      it "全入力項目登録チェック" do
        expect(build(:post, :with_address, :with_placeId, :with_reputation, :with_priority, :with_description, :post_ten_images, :post_ten_tasks)).to be_valid
      end

      it "title文字数チェック 40文字以下で登録できる" do
        expect(build(:post, :title_length_max)).to be_valid
      end

      it "budget文字数チェック 7桁以下で登録できる" do
        expect(build(:post, :budget_length_max)).to be_valid
      end

      it "budget文字数チェック 0で登録できる" do
        expect(build(:post, :budget_zero)).to be_valid
      end

      it "地図情報制限チェック address, place_id入力" do
        expect(build(:post, :with_address, :with_placeId)).to be_valid
      end

      it "reputation制限チェック 選択候補の場合" do
        expect(build(:post, :with_reputation)).to be_valid
      end

      it "priority制限チェック 選択候補の場合" do
        expect(build(:post, :with_priority)).to be_valid
      end

      it "image枚数制限チェック 10枚以下の場合" do
        expect(build(:post, :post_ten_images)).to be_valid
      end

      it "task個数制限チェック 10以下の場合" do
        expect(build(:post, :post_ten_tasks)).to be_valid
      end

    end

    context '異常系' do
      it "title必須チェック登録不可" do
        post = build(:post, title: nil)
        post.valid?
        expect(post.errors[:title]).to include("を入力してください")
      end

      it "budget必須チェック登録不可" do
        post = build(:post, budget: nil)
        post.valid?
        expect(post.errors[:budget]).to include("を入力してください")
      end

      it "deadline必須チェック登録不可" do
        post = build(:post, deadline: nil)
        post.valid?
        expect(post.errors[:deadline]).to include("を入力してください")
      end

      it "user_id必須チェック登録不可" do
        post = build(:post, user_id: nil)
        post.valid?
        expect(post.errors[:user]).to include("を入力してください")
      end

      it "title文字数チェック 41文字以上で登録できない" do
        post = build(:post, :title_length_over)
        post.valid?
        expect(post.errors[:title]).to include("は40文字以内で入力してください")
      end

      it "budget文字数チェック 8桁以上で登録できない" do
        post = build(:post, :budget_length_over)
        post.valid?
        expect(post.errors[:budget]).to include("は10000000より小さい値にしてください")
      end

      it "budget文字数チェック マイナスで登録できない" do
        post = build(:post, :budget_minus)
        post.valid?
        expect(post.errors[:budget]).to include("は0以上の値にしてください")
      end

      it "budget文字数チェック 少数で登録できない" do
        post = build(:post, :budget_decimal)
        post.valid?
        expect(post.errors[:budget]).to include("は整数で入力してください")
      end

      # it "deadline日付制限チェック 存在しない日付で登録できない" do
      #   post = build(:post, deadline: '2020-02-31')
      #   post.valid?
      #   expect(post.errors[:deadline]).to include("は不正な値です")
      # end

      it "地図情報制限チェック place_id未入力の場合登録不可" do
        post = build(:post, :with_address)
        post.valid?
        expect(post.errors[:address]).to include("は候補の中から選択してください")
      end

      it "地図情報制限チェック address未入力の場合登録不可" do
        post = build(:post, :with_placeId)
        post.valid?
        expect(post.errors[:address]).to include("を入力してください")
      end

      it "reputation制限チェック 選択候補以外の場合登録不可" do
        post = build(:post, reputation: 6)
        post.valid?
        expect(post.errors[:reputation]).to include("は一覧にありません")
      end

      it "priority制限チェック 選択候補以外の場合登録不可" do
        post = build(:post, priority: 0)
        post.valid?
        expect(post.errors[:priority]).to include("は一覧にありません")
      end

      it "image枚数制限チェック 11枚以上の場合登録不可" do
        post = build(:post_eleven_images)
        post.valid?
        expect(post.errors[:images]).to include("は10文字以内で入力してください")
      end

      it "task個数制限チェック 11以上の場合登録不可" do
        post = build(:post_eleven_tasks)
        post.valid?
        expect(post.errors[:tasks]).to include("は10文字以内で入力してください")
      end
    end
  end
end