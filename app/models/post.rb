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
  validates :budget, presence: true, :numericality => { :greater_than_or_equal_to => 0, :less_than => 10000000, only_integer: true }
  validates :deadline, presence: true
  validates :reputation, inclusion: 1..5, allow_blank: true
  validates :priority, inclusion: 1..5, allow_blank: true
  validates :place_id, presence: true, if: :address_present?
  validates :address, presence: true, if: -> { place_id.present? }

  def address_present?
    if place_id.blank? && address.present?
      errors.add(:address, "は候補の中から選択してください")
    end
  end

  # TODO: 予実管理用カラム
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

  # HACK: テストは通るがビューが通らなくなる
  # validate  :deadline_valid?

  # private

  # def deadline_valid?
  #   date = deadline_before_type_cast
  #   return if date.blank?
  #   # YYYY-MM-DDに対して個別取得
  #   y = date[0, 4].to_i
  #   m = date[5, 2].to_i
  #   d = date[8, 2].to_i
  #   y = date[1].to_i # 日付形式が変更されてnilになる
  #   m = date[2].to_i # 日付形式が変更されてnilになる
  #   d = date[3].to_i # 日付形式が変更されてnilになる
  #   unless Date.valid_date?(date)
  #     errors.add(:deadline, "は不正な値です")
  #   end
  # end

end
