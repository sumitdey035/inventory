class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order,    index: true
      t.belongs_to :product
      t.integer :qty,         null: false

      t.timestamps
    end
  end
end
