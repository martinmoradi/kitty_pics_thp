Rails.application.routes.draw do
  get 'carts/show'
  get 'carts/update'
  get 'carts/destroy'
  get 'ratings/new'
  get 'ratings/update'
  get 'ratings/destroy'
  get 'orders/new'
  get 'orders/create'
  get 'orders/show'
  get 'addresses/index'
  get 'addresses/show'
  get 'addresses/new'
  get 'addresses/destroy'
  get 'addresses/update'
  get 'addresses/create'
  get 'addresses/edit'
  devise_for :users
  resources :products
  root "static#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
