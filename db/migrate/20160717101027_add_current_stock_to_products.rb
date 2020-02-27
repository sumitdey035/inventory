class AddCurrentStockToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :current_stock, :integer, default: 0
  end
end
