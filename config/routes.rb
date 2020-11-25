Rails.application.routes.draw do
  root 'products#index'

  resources :carts, only: %i[show destroy], path: 'my_cart'
  resource :cart, only: :show, as: :my_cart, path: 'my_cart'
  resources :products do
    resources :line_items
  end

  resources :line_items do
    post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
    post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  end
  resources :orders
  resources :charges

  devise_for :users, controllers: { registrations: 'users/registrations' }, path: '/', path_names: { sign_in: 'log_in',
                                                                                                     sign_out: 'log_out',
                                                                                                     password: 'secret',
                                                                                                     confirmation: 'verification',
                                                                                                     unlock: 'unblock',
                                                                                                     sign_up: 'sign_up' }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
