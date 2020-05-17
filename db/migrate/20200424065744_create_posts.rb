class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      # TODO:バリデーションかける
      t.string  :title,      null: false
      t.text    :description
      t.string  :address
      t.float   :latitude
      t.float   :longitude
      t.date    :deadline
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
