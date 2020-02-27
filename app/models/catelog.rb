class Catelog < ActiveRecord::Base
  paginates_per 10
  validates :name, :status, :pictures, presence: true
  
  has_many :catelog_items
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures

  def self.get_all
    all
  end

  def self.desc
    order(created_at: :desc)
  end
end