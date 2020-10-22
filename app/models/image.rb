# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_images_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :post, optional: true

  validates :post, presence: true
  validates :image, presence: true
end
