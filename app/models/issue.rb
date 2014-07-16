class Issue < ActiveRecord::Base
  belongs_to :magazine
  belongs_to :crew
  belongs_to :language
  belongs_to :size
  belongs_to :stitching
  belongs_to :medium
  belongs_to :format
  belongs_to :country

  validates :title, presence: true

  mount_uploader :front_cover, FrontCoverUploader
  mount_uploader :back_cover, FrontCoverUploader
  mount_uploader :featured_image, FrontCoverUploader

  def location
    location = []
    if self.city != ""
      location << self.city
    end
    if self.state != ""
      location << self.state
    end
    if self.country != nil
      location << self.country
    end
    location.join(', ')
  end

  def self.search(query)
    where('to_tsvector(magazine) @@ plainto_tsquery(?)', query)
  end
end
