class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :post, optional: true

  validates :post, presence: true
  validates :image, presence: true
end
