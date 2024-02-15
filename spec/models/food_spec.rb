require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user1 = User.create(name: 'John Denver', email: 'johndenver@gmail.com', password: 'me1234')
    @recipe = Recipe.create(name: 'Chicken Soup', preparation_time: '25', cooking_time: '25',
                            description: 'The recipe description.', public: false, user: @user1)
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
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many recipe_foods' do
      food = Food.create(name: 'Chicken', measurement_unit: 'kg', user: @user1)
      recipe_food1 = RecipeFood.create(food:, recipe: @recipe)
      recipe_food2 = RecipeFood.create(food:, recipe: @recipe)

      expect(food.recipe_foods).to include(recipe_food1, recipe_food2)
    end

    it 'destroys associated recipe_foods when destroyed' do
      food = Food.create(name: 'Chicken', measurement_unit: 'kg', user: @user1)
      RecipeFood.create(food:, recipe: @recipe)

      expect { food.destroy }.to change { RecipeFood.count }.by(-1)
    end
  end
end
