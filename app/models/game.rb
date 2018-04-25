class Game < ApplicationRecord
  has_attached_file :image,  :default_url => '/system/games/images/missing.png'
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_many :likes
  accepts_nested_attributes_for :likes

  def image_url
     image.url
  end

end
