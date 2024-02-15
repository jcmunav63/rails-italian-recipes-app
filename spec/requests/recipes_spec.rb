require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  include Rails.application.routes.url_helpers

  describe 'GET /recipes' do
    it 'returns a success response' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      get user_recipes_path(user)
      expect(response).to have_http_status(:ok) # Expecting status code 200
    end
  end

  describe 'GET /recipes/:id' do
    it 'returns a success response' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      recipe = FactoryBot.create(:recipe, user:)
      get user_recipe_path(user, recipe)
      expect(response).to have_http_status(:ok) # Expecting status code 200
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      get new_user_recipe_path(user.id)
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new recipe' do
        user = FactoryBot.create(:user, :confirmed)
        sign_in user
        expect do
          post user_recipes_path(user), params: { recipe: attributes_for(:recipe) }
        end.to change(Recipe, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new recipe' do
        user = FactoryBot.create(:user, :confirmed)
        sign_in user
        expect do
          post user_recipes_path(user), params: { recipe: attributes_for(:recipe, name: nil) }
        end.to_not change(Recipe, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipe' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      recipe = FactoryBot.create(:recipe, user:)
      expect do
        delete user_recipe_path(user, recipe)
      end.to change { Recipe.count }.by(-1)
    end
  end
end
