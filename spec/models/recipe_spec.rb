require 'rails_helper'
RSpec.describe Recipe, type: :model do
  before(:each) do
    @user1 = User.create(name: 'John Denver', email: 'johndenver@gmail.com', password: 'me1234')
    @user2 = User.create(name: 'Jane Summer', email: 'janesummer@gmail.com', password: 'me1234')
  end
  describe 'validations' do
    it 'is valid with valid attributes' do
      recipe = Recipe.new(name: 'Chicken Curry', description: 'Delicious curry recipe', user: @user1)
      expect(recipe).to be_valid
    end
    it 'is not valid without a name' do
      recipe = Recipe.new(description: 'Delicious curry recipe', user: @user1)
      expect(recipe).not_to be_valid
    end
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods).dependent(:destroy) }
  end
  describe '#total_price' do
    it 'calculates the total price of the recipe' do
      food1 = create(:food, user: @user1, price: 10)
      food2 = create(:food, user: @user1, price: 5)
      recipe = create(:recipe, user: @user1)
      create(:recipe_food, recipe:, food: food1, quantity: 2)
      create(:recipe_food, recipe:, food: food2, quantity: 3)
      expect(recipe.total_price).to eq(35)
    end
  end
end
