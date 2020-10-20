# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  delegate :nickname, :to => :user, :prefix => true
end
