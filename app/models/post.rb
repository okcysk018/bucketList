# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  address      :string(255)
#  budget       :integer          not null
#  deadline     :date             not null
#  description  :text(65535)
#  done_flag    :boolean          default(FALSE)
#  priority     :integer
#  private_flag :boolean          default(FALSE)
#  reputation   :integer
#  title        :string(255)      not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  place_id     :string(255)
#  user_id      :integer          not null
#
class Post < ApplicationRecord
  belongs_to  :user
  has_many    :comments,  dependent: :destroy
  has_many    :images,    dependent: :destroy
  has_many    :tasks,     dependent: :destroy

  delegate :nickname, to: :user, prefix: true

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :tasks, allow_destroy: true
  acts_as_taggable_on :categories

  # TODO: バリデーション
  validates :title, presence: true, length: { maximum: 40 }
  validates :images, length: { maximum: 10 }
  validates :tasks, length: { maximum: 10 }
  validates :budget, presence: true, inclusion: 0..9999999
  validates :deadline, presence: true

  # with_options if: :post_done? do
  #   validates :cost, presence: true, inclusion: 0..9999999
  #   validates :actual_date, presence: true
  #   validates :reputation, presence: true
  # end

  # def post_done?
  #   done_flag == 1
  # end

  scope :private_post, -> { where(private_flag: 0) }

  # def self.search(search)
  #   return Post.all unless search
  #   Post.where(['title LIKE(?) OR address LIKE(?)', "%#{search}%", "%#{search}%"])
  # end

  # HACK: post.private_flag?を認識しなくなるので保留
  # enum private_flag: {public_post: 0, private_post: 1}
end
