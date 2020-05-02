class Post < ApplicationRecord
  validates :title, presence: true
  validates :budget, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
  # has_many :categories, through: :category_tags

  acts_as_taggable_on :categories
  # autocomplete :tag, :name
end
