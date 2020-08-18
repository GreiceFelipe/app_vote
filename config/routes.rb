Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "campaigns#index"

  resources :campaigns, only: [:index, :show]
  resources :votes, only: [:show, :create, :update]
end
