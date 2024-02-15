require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user1 = User.create(name: 'John Denver', email: 'johndenver@gmail.com', password: 'me1234')
    @recipe = create(:recipe)
    @food = create(:food)
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
      # recipe = create(:recipe)
      recipe_food = described_class.new(recipe: @recipe)
      expect(recipe_food).not_to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:recipe) }
    it { should belong_to(:food) }
  end
end
