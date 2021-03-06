Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'products#index'

  resources :carts, only: %i[show destroy], path: 'my_cart'
  resource :cart, only: :show, as: :my_cart, path: 'my_cart'
  resources :products do
    resources :line_items, only: %i[create new create destroy]
  end

  resources :line_items
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'

  resources :orders, only: %i[index show new]
  resources :charges, only: %i[new create]

  resources :categories, only: nil do
    resources :products, only: :index
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }, path: '/', path_names: { sign_in: 'log_in',
                                                                                                     sign_out: 'log_out',
                                                                                                     password: 'secret',
                                                                                                     confirmation: 'verification',
                                                                                                     unlock: 'unblock',
                                                                                                     sign_up: 'sign_up' }

  resources :users, only: %i[show edit update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
