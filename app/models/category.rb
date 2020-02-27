class Category < ActiveRecord::Base
  paginates_per 10

  validates :name, :categorized_object, presence: true

  class << self # Methods =>  [post_categories, product_categories] 
    CONFIG["category_objects"].each do |object|
      define_method "#{object.singularize}_categories" do
        where(categorized_object: object)
      end
    end
  end

  def self.get_all
    all
  end

  def self.desc
    order(created_at: :desc)
  end
end