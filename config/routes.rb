Rails.application.routes.draw do
  resources :products
  resource :cart, only: [:show] do
    post 'add_to_cart/:product_id', action: :add_to_cart, as: 'add_to_cart'
    delete 'remove_from_cart/:id', action: :remove_from_cart, as: 'remove_from_cart'
  end
  resources :orders
  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  root to: 'products#index'
end
