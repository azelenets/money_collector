Rails.application.routes.draw do
  root to: 'welcome#index'

  devise_for :users, skip: :registrations

  resources :currencies, only: [:index, :show]
  resources :countries, only: [:index, :show] do
    authenticate :user do
      put :visit, on: :member
    end
  end
  resources :trips do
    authenticate :user do
      put :finish, on: :member
    end
  end
end
