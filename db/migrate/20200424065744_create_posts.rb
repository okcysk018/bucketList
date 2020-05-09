class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      # TODO:日付と場所の型
      t.string :title,      null: false
      t.text :description
      t.string :place
      t.date :deadline
      t.integer :budget
      t.integer :reputation
      t.integer :priority
      t.boolean :done_flag
      t.boolean :private_flag
      t.timestamps

      # 外部キー
      t.integer :user_id, foreign_key: true
    end
    # TODO:ロールバック時のエラー回避
    # add_index :posts, :title
  end
end
