Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
    # get :map, on: :member
    # get :map, on: :collection
    get :search, on: :collection
  end
  resources :users, only: :show
end
