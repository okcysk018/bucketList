class Task < ApplicationRecord

  # belongs_to :post
  belongs_to :post, optional: true

  # TODO: バリデーション
  validates :post, presence: true
  # validates :title, presence: true


end
