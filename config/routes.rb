Rails.application.routes.draw do
  get 'foods/index'
  devise_for :users
  get 'recipes/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "recipes#index"

  resources :users, only: [:index] do
    resources :recipes, only: [:index, :new, :create, :destroy, :show] do
      resources :recipe_foods, only: [:index, :new, :create, :destroy] do
      end
    end
    resources :foods, only: [:index, :new, :create, :destroy] do
    end
  end
  get 'public_recipes', to: 'recipes#public_recipes'
end
