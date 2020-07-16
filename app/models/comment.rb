class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  delegate :nickname, :to => :user, :prefix => true
end
