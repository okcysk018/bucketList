class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :tasks, allow_destroy: true
  acts_as_taggable_on :categories

  # GoogleMap用のカラム
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # TODO: バリデーション
  validates :title, presence: true
  validates :images, length: {maximum: 10}
  validates :budget, presence: true
  validates :deadline, presence: true

end
