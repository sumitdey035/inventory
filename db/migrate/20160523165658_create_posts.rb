class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string  :title,         null: false
      t.text    :description,   null: false
      t.integer :status,        null: false
      t.integer :category_id,   null: false
      t.integer :user_id,       null: false
      t.boolean :featured,      null: false
      t.integer :likes,         default: 0

      t.timestamps
    end
  end
end
