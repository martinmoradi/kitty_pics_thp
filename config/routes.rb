Rails.application.routes.draw do
<<<<<<< HEAD
  root "products#index"

<<<<<<< HEAD
  
  resources :carts
  resources :products do 
    resources :line_items
  end
  
=======
  get "carts/:id" => "carts#show", as: "my_cart"
  delete "carts/:id" => "carts#destroy"

  post "line_items/:id/add" => "line_items#add_quantity", as: "line_item_add"
  post "line_items/:id/reduce" => "line_items#reduce_quantity", as: "line_item_reduce"
  post "line_items" => "line_items#create"
  get "line_items/:id" => "line_items#show", as: "line_item"
  delete "line_items/:id" => "line_items#destroy"

  resources :products
>>>>>>> d09e2edb4277dfc3f9bcc7bf697348377047dd8e
  resources :orders

  devise_for :users, controllers: { registrations: "users/registrations" }, path: "/", path_names: { sign_in: "log_in",
                                                                                                     sign_out: "logout",
                                                                                                     password: "secret",
                                                                                                     confirmation: "verification",
                                                                                                     unlock: "unblock",
                                                                                                     sign_up: "sign_up" }

=======
  root 'products#index'

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

>>>>>>> c75ee0ebe9d596ccabcd59923929db59c4ce9040
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
