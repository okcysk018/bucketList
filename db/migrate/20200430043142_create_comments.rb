class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      # 外部キー
      t.integer :user_id, foreign_key: true
      t.integer :post_id, foreign_key: true

      t.text :text
      t.timestamps
    end
  end
end
