class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  
  # Paperclip config
  has_attached_file :avatar, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  scope :desc,        ->{ order(created_at: :desc) }
end
