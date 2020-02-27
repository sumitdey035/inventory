class Brand < ActiveRecord::Base
  paginates_per 10
  
  validates :name, :owner_name, presence: true

  def self.get_all
    all
  end

  def self.desc
    order(created_at: :desc)
  end
end