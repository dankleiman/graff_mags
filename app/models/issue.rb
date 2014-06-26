class Issue < ActiveRecord::Base
  validates :magazine, presence: true
  validates :title, presence: true

  mount_uploader :cover, CoverUploader

  def self.city(city)
    where('city = ?', city)
  end
end
