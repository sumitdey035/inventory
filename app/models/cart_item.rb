class CartItem < ActiveRecord::Base
  belongs_to :product
  
  scope :get_by_product,    ->(product_id){ where(product_id: product_id) }
end
