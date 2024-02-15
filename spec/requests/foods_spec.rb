require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      get user_foods_path(user)
      expect(response).to have_http_status(:ok) # Expecting status code 200
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      get new_user_food_path(user)
      expect(response).to have_http_status(:ok) # Expecting status code 200
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new food' do
        user = FactoryBot.create(:user, :confirmed)
        sign_in user
        expect do
          post user_foods_path(user), params: { food: attributes_for(:food) }
        end.to change(Food, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new food' do
        user = FactoryBot.create(:user, :confirmed)
        sign_in user
        expect do
          post user_foods_path(user), params: { food: attributes_for(:food, name: nil) }
        end.to_not change(Food, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food' do
      user = FactoryBot.create(:user, :confirmed)
      sign_in user
      food = FactoryBot.create(:food, user:)
      expect do
        delete user_food_path(user, food)
      end.to change(Food, :count).by(-1)
      expect(response).to redirect_to(user_foods_path(user))
    end
  end
end
