class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string      :title,     null: false
      t.boolean     :done_flag
      t.date        :deadline
      t.timestamps

      t.references  :post, null: false, foreign_key: true
    end
  end
end
