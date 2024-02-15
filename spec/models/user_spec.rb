require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John Smith', email: 'johnsmith@gmail.com', password: 'me1234')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(email: 'janesummer@gmail.com', password: 'me1234')
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    it 'should not have many recipes' do
      user = User.new(name: 'John Smith', email: 'johnsmith@gmail.com', password: 'me1234')
      expect(user.recipes).to be_empty
    end

    it 'should not have many foods' do
      user = User.new(name: 'John Smith', email: 'johnsmith@gmail.com', password: 'me1234')
      expect(user.foods).to be_empty
    end
  end
end
