class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name,             null: false
      t.text :description
      t.integer :status,          null: false
      t.integer :category_id,     null: false
      t.decimal :product_price,   null: false, default: 0
      t.decimal :sell_price,      null: false, default: 0
      t.integer :product_type,    null: false
      t.integer :featured,        null: false, default: 0
      t.integer :sku,             null: false, uniq: true
      t.integer :brand_id,        null: false
      t.string :place_of_origin
      t.string :design
      t.boolean :has_blouse_piece,null: false, default: false
      t.integer :likes,           default: 0


      t.timestamps
    end
  end
end
