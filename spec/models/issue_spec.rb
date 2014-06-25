require 'rails_helper'

RSpec.describe Issue, :type => :model do
  describe '.city("Boston")' do
    it 'returns issues published in Boston' do

      no_comply = Issue.create!(title: 'Issue 3', magazine: 'No Comply', city: 'Boston')
      helmet_heads = Issue.create!(title: 'Issue 10', magazine: 'Helmet Heads', city: 'New York')
      tuff_city = Issue.create!(title: '3', magazine: 'Tuff City', city: 'Boston')

      results = Issue.city("Boston")

      expect(results).to include(no_comply)
      expect(results).to include(tuff_city)

      expect(results).to_not include(helmet_heads)
    end
  end
end
