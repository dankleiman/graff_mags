require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'admin checks' do
    it 'is not an admin if the role is not admin' do
      user = FactoryGirl.build(:user)
      expect(user).to_not be_is_admin
    end

    it 'is an admin if the role is admin' do
      user = FactoryGirl.build(:user, role: 'admin')
      expect(user).to be_is_admin
    end
  end
end
