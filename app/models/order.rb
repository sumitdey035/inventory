class Order < ActiveRecord::Base
  attr_accessor :product_ids, :qtys

  validates :user_id, :address_id, :status, :serial, presence: true

  belongs_to :user
  belongs_to :address
  has_many :order_items

  scope :desc,    ->{ order(created_at: :desc) }
end
