class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
  acts_as_taggable_on :categories

  validates :title, presence: true
  validates :budget, presence: true
  # validates :images, presence: true, length: {minimum: 1, maximum: 10}

end
