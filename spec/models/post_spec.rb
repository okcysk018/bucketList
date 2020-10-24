# spec/models/モデル_spec
require 'rails_helper'
describe Post do
  describe '#create' do
    it "title必須チェック" do
      post = Post.new(title: nil, budget: 1000, deadline: 2020-01-01, user_id: 1
      )
      post.valid?
      expect(post.errors[:title]).to include("can't be blank")
    end
  end
end