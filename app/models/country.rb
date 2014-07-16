class Country < ActiveRecord::Base
  has_many :issues
end
