require 'rails_helper'

RSpec.describe 'Recipes', type: :system do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.zone.now) }
  let!(:recipes) { FactoryBot.create_list(:recipe, 3, user:, public: true) }

  before do
    sign_in user
  end

  it 'visits the Recipes Index Page' do
    visit user_recipes_path(user)
    expect(page).to have_content('Recipes Index Page')
    recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.description)
    end
  end

  it 'creates a new recipe' do
    visit new_user_recipe_path(user)
    fill_in 'Name', with: 'New Test Recipe'
    fill_in 'Preparation time', with: '10'
    fill_in 'Cooking time', with: '20'
    fill_in 'Description', with: 'Test Description'
    click_button 'Create Recipe'
    expect(page).to have_content('Recipe was successfully created!')
  end

  it 'views Public Recipes' do
    visit public_recipes_path
    expect(page).to have_content('Public Recipes')
    recipes.each do |recipe|
      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.user.name)
    end
  end

  describe 'Recipe Details' do
    let(:recipe) { recipes.first }

    it 'shows recipe details and allows to generate shopping list and add ingredient' do
      visit user_recipe_path(user, recipe)
      expect(page).to have_content(recipe.name)
      expect(page).to have_link('Generate shopping list')
      expect(page).to have_link('Add ingredient')
    end
  end
end
