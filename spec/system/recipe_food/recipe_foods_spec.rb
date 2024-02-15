require 'rails_helper'
RSpec.describe 'RecipeFoods', type: :system do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let!(:recipe_foods) { create_list(:recipe_food, 3, recipe:) }
  before do
    sign_in user
  end
  describe 'Shopping List' do
    it 'shows the correct total food to buy and total value' do
      visit generate_shopping_list_user_recipe_path(user, recipe)
      expect(page).to have_content('Amount of food to buy:')
      expect(page).to have_content('Total value of food needed:')
    end
  end
  describe 'Recipes Index Page' do
    let!(:recipes) { create_list(:recipe, 2, user:) }
    it 'lists all recipes and has a link to add new recipe' do
      visit user_recipes_path(user)
      expect(page).to have_content('Recipes Index Page')
      expect(page).to have_link('New Recipe', href: new_user_recipe_path(user))
      recipes.each do |recipe|
        expect(page).to have_content(recipe.name)
      end
    end
  end
  describe 'New Recipe' do
    it 'renders the new recipe form' do
      visit new_user_recipe_path(user)
      expect(page).to have_selector('form')
      expect(page).to have_field('Name')
      expect(page).to have_field('Preparation time')
      expect(page).to have_field('Cooking time')
      expect(page).to have_field('Description')
    end
  end
  describe 'Public Recipes' do
    let!(:public_recipes) { create_list(:recipe, 2, user:, public: true) }
    it 'shows public recipes' do
      visit public_recipes_path
      public_recipes.each do |recipe|
        expect(page).to have_content(recipe.name)
      end
    end
  end
  describe 'Recipe Details' do
    it 'shows recipe details including ingredients' do
      visit user_recipe_path(user, recipe)
      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.preparation_time)
      expect(page).to have_content(recipe.cooking_time)
      expect(page).to have_content(recipe.description)
      recipe.recipe_foods.each do |recipe_food|
        expect(page).to have_content(recipe_food.food.name)
        expect(page).to have_content(recipe_food.quantity)
      end
    end
  end
end