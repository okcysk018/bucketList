# spec/models/モデル_spec
require 'rails_helper'
describe Post do
  describe '#create' do
    it "正常系チェック" do
      post = build(:post)
      expect(post).to be_valid
    end

    it "title必須チェック" do
      post = build(:post, title: nil)
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "budget必須チェック" do
      post = build(:post, budget: nil)
      post.valid?
      expect(post.errors[:budget]).to include("を入力してください")
    end

    it "deadline必須チェック" do
      post = build(:post, deadline: nil)
      post.valid?
      expect(post.errors[:deadline]).to include("を入力してください")
    end

    it "title文字数チェック 41文字以上で登録できない" do
      title41 = Faker::Lorem.characters(number: 41)
      post = build(:post, title: title41)
      post.valid?
      expect(post.errors[:title]).to include("は40文字以内で入力してください")
    end

    it "title文字数チェック 40文字以下で登録できる" do
      title40 = Faker::Base.regexify("[aあ]{40}")
      post = build(:post, title: title40)
      expect(post).to be_valid
    end

    it "budget文字数チェック 8桁以上で登録できない" do
      number8 = 10000000
      post = build(:post, budget: number8)
      post.valid?
      expect(post.errors[:budget]).to include("は10000000より小さい値にしてください")
    end

    it "budget文字数チェック 7桁以下で登録できる" do
      number7 = 9999999
      post = build(:post, budget: number7)
      expect(post).to be_valid
    end

    it "budget文字数チェック 0で登録できる" do
      number0 = 0
      post = build(:post, budget: number0)
      expect(post).to be_valid
    end

    it "budget文字数チェック マイナスで登録できない" do
      minusNumber = -1
      post = build(:post, budget: minusNumber)
      post.valid?
      expect(post.errors[:budget]).to include("は0以上の値にしてください")
    end

    it "budget文字数チェック 少数で登録できない" do
      decimalNumber = Faker::Number.decimal(l_digits: 2)
      post = build(:post, budget: decimalNumber)
      post.valid?
      expect(post.errors[:budget]).to include("は整数で入力してください")
    end

    # it "deadline日付制限チェック 存在しない日付で登録できない" do
    #   post = build(:post, deadline: '2020-02-31')
    #   post.valid?
    #   expect(post.errors[:deadline]).to include("は不正な値です")
    # end

    it "地図情報制限チェック place_id未入力の場合" do
      post = build(:post, address: '日本、東京都東京')
      post.valid?
      expect(post.errors[:address]).to include("は候補の中から選択してください")
    end

    it "地図情報制限チェック address未入力の場合" do
      post = build(:post, place_id: 'ChIJXSModoWLGGARILWiCfeu2M0')
      post.valid?
      expect(post.errors[:address]).to include("を入力してください")
    end

    it "地図情報制限チェック 登録可能" do
      post = build(:post, address: '日本、東京都東京', place_id: 'ChIJXSModoWLGGARILWiCfeu2M0')
      expect(post).to be_valid
    end

    it "reputation制限チェック 選択候補以外の場合" do
      post = build(:post, reputation: 6)
      post.valid?
      expect(post.errors[:reputation]).to include("は一覧にありません")
    end

    it "reputation制限チェック 選択候補の場合" do
      post = build(:post, reputation: Faker::Number.between(from: 1, to: 5))
      expect(post).to be_valid
    end

    it "priority制限チェック 選択候補以外の場合" do
      post = build(:post, priority: 0)
      post.valid?
      expect(post.errors[:priority]).to include("は一覧にありません")
    end

    it "priority制限チェック 選択候補の場合" do
      post = build(:post, priority: Faker::Number.within(range: 1..5))
      expect(post).to be_valid
    end

    it "image枚数制限チェック 11枚以上の場合" do
      post = build(:post_eleven_images)
      post.valid?
      expect(post.errors[:images]).to include("は10文字以内で入力してください")
    end

    it "image枚数制限チェック 10枚以下の場合" do
      post = build(:post_ten_images)
      expect(post).to be_valid
    end

    it "task個数制限チェック 11以上の場合" do
      post = build(:post_eleven_tasks)
      post.valid?
      expect(post.errors[:tasks]).to include("は10文字以内で入力してください")
    end

    it "task個数制限チェック 10以下の場合" do
      post = build(:post_ten_tasks)
      expect(post).to be_valid
    end

  end
end