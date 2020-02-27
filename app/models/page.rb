class Page < ActiveRecord::Base

  paginates_per 10
  validates :title, :description, :user_id, presence: true

  def self.get_all
    all
  end

  def self.desc
    order(created_at: :desc)
  end
end
