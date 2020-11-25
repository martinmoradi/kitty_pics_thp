Rails.application.routes.draw do
<<<<<<< HEAD
  root "products#index"
=======
  root 'products#index'
>>>>>>> 3580e1adf76a98bb50090e9b84164e9568d847cc

  resources :carts, only: %i[show destroy], path: 'my_cart'
  resource :cart, only: :show, as: :my_cart, path: 'my_cart'
  resources :products do
    resources :line_items, only: %i[create new create destroy]
  end

  resources :line_items
  post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  #   post 'line_items/:id/add' => 'line_items#add_quantity', as: 'line_item_add'
  #   post 'line_items/:id/reduce' => 'line_items#reduce_quantity', as: 'line_item_reduce'
  # end

  resources :orders, only: %i[index show new]
  resources :charges, only: %i[new create]

  devise_for :users, controllers: { registrations: 'users/registrations' }, path: '/', path_names: { sign_in: 'log_in',
                                                                                                     sign_out: 'log_out',
                                                                                                     password: 'secret',
                                                                                                     confirmation: 'verification',
                                                                                                     unlock: 'unblock',
                                                                                                     sign_up: 'sign_up' }

<<<<<<< HEAD
  resources :users
=======
>>>>>>> 3580e1adf76a98bb50090e9b84164e9568d847cc
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
