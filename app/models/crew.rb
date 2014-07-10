class Crew < ActiveRecord::Base
  has_many :issues
end
