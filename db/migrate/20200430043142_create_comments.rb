class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      # 外部キー
      t.integer :user_id, foreign_key: true
      t.integer :post_id, foreign_key: true

      t.text :text
      t.timestamps
    end
    # TODO:ロールバック時のエラー回避
    # add_index :comments, :user_id
    # add_index :comments, :post_id
  end
end
