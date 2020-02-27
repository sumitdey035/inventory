class Post < ActiveRecord::Base
  paginates_per 10
  validates :title, :status, :category_id, :description, :user_id, presence: true

  belongs_to :user
  belongs_to :brand
  belongs_to :category
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures

  before_save :make_this_post_featured

  def self.get_all
    all
  end

  def self.desc
    order(created_at: :desc)
  end

  def self.featured
    where(featured: true).first || where(status: 1).last
  end

  def self.published
    where(status: 1)
  end

  def save_pictures(picture)
    self.pictures.create(:avatar=> picture)
  end

  private
  def make_this_post_featured
    Post.where.not(id: id).update_all(featured: false) if featured
  end
end