class Issue < ActiveRecord::Base
  validates :magazine, presence: true
  validates :title, presence: true

  mount_uploader :front_cover, FrontCoverUploader
  mount_uploader :back_cover, FrontCoverUploader
  mount_uploader :featured_image, FrontCoverUploader

  def self.city(city)
    where('city = ?', city)
  end
end
