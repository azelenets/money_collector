Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users, skip: :registrations

  resources :currencies, only: [:index, :show]
  resources :countries, only: [:index, :show] do
    put :visit, on: :member
  end
  resources :trips do
    put :finish, on: :member
  end
end
