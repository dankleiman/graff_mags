class Issue < ActiveRecord::Base
  validates :magazine, presence: true
  validates :title, presence: true
end
