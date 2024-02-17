Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index'
  get 'foods/index'
  get 'about/show'

  get 'up' => 'rails/health#show', as: :rails_health_check

  root to: "recipes#index"

  resources :users, only: [:index] do
    resources :recipes, only: [:index, :new, :create, :destroy, :show] do
      resources :recipe_foods, only: [:index, :new, :create, :destroy] do
      end
      member do
        get 'generate_shopping_list', to: 'recipes#generate_shopping_list'
      end
    end
    resources :foods, only: [:index, :new, :create, :destroy] do
    end
  end
  get 'public_recipes', to: 'recipes#public_recipes'
end
