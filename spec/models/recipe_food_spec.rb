require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user1 = User.create(name: 'John Denver', email: 'johndenver@gmail.com', password: 'me1234')
    @recipe = Recipe.create(name: 'Chicken Curry', description: 'Delicious curry recipe', user: @user1)
    @food = Food.create(name: 'Chicken', measurement_unit: 'kg', user: @user1)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      recipe_food = described_class.new(recipe: @recipe, food: @food)
      expect(recipe_food).to be_valid
    end

    it 'is not valid without a recipe' do
      recipe_food = described_class.new(food: @food)
      expect(recipe_food).not_to be_valid
    end

    it 'is not valid without a food' do
      recipe_food = described_class.new(recipe: @recipe)
      expect(recipe_food).not_to be_valid
    end
  end

  describe 'associations' do
    recipe = Recipe.create(name: 'Chicken Curry', description: 'Delicious curry recipe', user: @user1)
    food = Food.create(name: 'Chicken', measurement_unit: 'kg', user: @user1)
    recipe_food = RecipeFood.create(recipe: recipe, food: food)

    it 'belongs to a recipe' do
      expect(recipe_food.recipe).to eq(recipe)
    end

    it 'belongs to a food' do
      expect(recipe_food.food).to eq(food)
    end
  end
end
