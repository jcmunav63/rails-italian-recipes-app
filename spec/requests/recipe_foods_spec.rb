require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  include Rails.application.routes.url_helpers
  describe 'GET #new' do
    it 'returns a success response' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      recipe = create(:recipe, user:)
      get new_user_recipe_recipe_food_path(user, recipe)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new recipe_food' do
        user = FactoryBot.create(:user, :confirmed)
        sign_in user
        recipe = FactoryBot.create(:recipe, user:)
        food = FactoryBot.create(:food, user:)
        expect do
          post user_recipe_recipe_foods_path(user, recipe), params: { recipe_food: { food_id: food.id, quantity: 1 } }
        end.to change(RecipeFood, :count).by(1)
        expect(response).to redirect_to(user_recipe_path(user, recipe))
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipe_food' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      recipe = FactoryBot.create(:recipe, user:)
      food = FactoryBot.create(:food, user:)
      recipe_food = FactoryBot.create(:recipe_food, recipe:, food:)
      expect do
        delete user_recipe_recipe_food_path(user, recipe, recipe_food)
      end.to change(RecipeFood, :count).by(-1)
      expect(response).to redirect_to(user_recipe_path(user, recipe))
    end
  end
end
