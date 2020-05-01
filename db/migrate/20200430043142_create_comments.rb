class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      # 外部キー
      t.integer :user_id
      t.integer :post_id

      t.text :text
      t.timestamps
    end
  end
end
