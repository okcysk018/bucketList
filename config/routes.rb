Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'autocomplete'
    end
  end
  # resources :tags do
  #   get :autocomplete_tag_name, on: :collection
  # end
  resources :users, only: :show
end
