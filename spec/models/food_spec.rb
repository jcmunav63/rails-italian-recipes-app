require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user1 = User.create(name: 'John Denver', email: 'johndenver@gmail.com', password: 'me1234')
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      food = Food.new(name: 'Chicken', measurement_unit: 'kg', user: @user1)
      expect(food).to be_valid
    end
  
    it 'is not valid without a name' do
      food = Food.new(measurement_unit: 'kg', user: @user1)
      expect(food).not_to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods).dependent(:destroy) }
  end
end