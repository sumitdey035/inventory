class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  # after_save :set_orders

  def self.set_order_items(product_ids, qtys)
    no = 0;
    price = 0
    product_ids.each do |product_id|
      order_item = create(product_id: product_id, qty: qtys[no])
      price += (qtys[no].to_i*order_item.product.sell_price)
      no += 1
      order_item.product.update_column(:current_stock, order_item.product.current_stock-1)
    end
    price
  end

  private
  def set_orders
    Order.set_order
  end
end
