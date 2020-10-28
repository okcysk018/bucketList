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

    # Faker::Number.between(from: 1, to: 10) #=> 7
    # Faker::Number.within(range: 1..10) #=> 7

  end
end