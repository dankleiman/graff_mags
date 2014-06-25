class Issue < ActiveRecord::Base
  validates :magazine, presence: true
  validates :title, presence: true

  def self.city(city)
    where('city = ?', city)
  end
end
