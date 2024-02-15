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
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many recipe_foods with dependent destroy' do
      recipe = Recipe.create(name: 'Chicken Curry', description: 'Delicious curry recipe', user: @user1)
      food = Food.create(name: 'Chicken', measurement_unit: 'kg', user: @user1)
      recipe_food = RecipeFood.create(recipe:, food:)

      expect(recipe.recipe_foods).to include(recipe_food)
      expect { recipe.destroy }.to change { RecipeFood.count }.by(-1)
    end
  end

  describe '#total_price' do
    it 'calculates the total price of the recipe' do
      food1 = Food.create(user: @user1, name: 'Food 1', measurement_unit: 'kg', price: 10)
      food2 = Food.create(user: @user1, name: 'Food 2', measurement_unit: 'kg', price: 5)
      recipe = Recipe.create(user: @user1, name: 'A Delicious Recipe', preparation_time: '25', cooking_time: '30',
                             description: 'A delicious recipe description.', public: false)
      RecipeFood.create(recipe:, food: food1, quantity: 2)
      RecipeFood.create(recipe:, food: food2, quantity: 3)

      expect(recipe.total_price).to eq(35)
    end
  end
end
