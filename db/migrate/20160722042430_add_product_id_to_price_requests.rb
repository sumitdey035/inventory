class AddProductIdToPriceRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :price_requests, :product_id, :integer
  end
end
