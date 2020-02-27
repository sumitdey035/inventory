class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :serial,              null: false
      t.integer :status,              null: false
      t.decimal :total_price,         default: 0
      t.decimal :shipping,            default: 0
      t.decimal :tax,                 default: 0
      t.decimal :adjustment,          default: 0
      t.decimal :final_price,         default: 0

      t.belongs_to :address
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
