class PriceRequest < ActiveRecord::Base
  paginates_per 10
  validates :name, :email_id, :mobile_no, :product_id, presence: true

  belongs_to :product

  def self.get_all
    all
  end

  def self.desc
    order(created_at: :desc)
  end
end