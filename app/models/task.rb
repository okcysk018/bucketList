class Task < ApplicationRecord

  belongs_to :post, optional: true

  validates :post, presence: true
  validates :title, presence: true

end
