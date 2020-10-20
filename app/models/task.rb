# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  deadline   :date
#  done_flag  :boolean
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#
# Indexes
#
#  index_tasks_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
class Task < ApplicationRecord

  belongs_to :post, optional: true

  validates :post, presence: true
  validates :title, presence: true

end
