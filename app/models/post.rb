class Post < ApplicationRecord

  belongs_to  :user
  has_many    :comments,  dependent: :destroy
  has_many    :images,    dependent: :destroy
  has_many    :tasks,     dependent: :destroy

  delegate :nickname, :to => :user, :prefix => true

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :tasks, allow_destroy: true
  acts_as_taggable_on :categories

  # TODO: バリデーション
  validates :title, presence: true, length: { maximum: 40 }
  validates :images, length: {maximum: 10}
  validates :tasks, length: {maximum: 10}
  validates :budget, presence: true, inclusion: 0..9999999
  validates :deadline, presence: true

  # def self.search(search)
  #   return Post.all unless search
  #   Post.where(['title LIKE(?) OR address LIKE(?)', "%#{search}%", "%#{search}%"])
  # end

end
