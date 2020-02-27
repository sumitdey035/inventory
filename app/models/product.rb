class Product < ActiveRecord::Base
  paginates_per 10
  validates :name, :status, :description, :category_id, :product_type, :featured, :sku, :brand_id, presence: true

  belongs_to :user
  belongs_to :brand
  belongs_to :category
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many  :price_requests
  accepts_nested_attributes_for :pictures

  def self.get_all
    all
  end

  def self.desc
    order(created_at: :desc)
  end

  def save_pictures(picture)
    self.pictures.create(:avatar=> picture)
  end
end