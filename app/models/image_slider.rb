class ImageSlider < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :pictures, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :pictures

  before_save :make_other_sliders_off

  scope :get_all, ->{ all }
  scope :desc,    ->{ order(created_at: :desc) }
  scope :live,    ->{ where(status: true).first || first }

  private
  def make_other_sliders_off
    ImageSlider.not(id: id).update_all(status: false) if status
  end
end