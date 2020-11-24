Rails.application.routes.draw do

  root "products#index"

  get "carts/:id" => "carts#show", as: "my_cart"
  delete "carts/:id" => "carts#destroy"

  post "line_items/:id/add" => "line_items#add_quantity", as: "line_item_add"
  post "line_items/:id/reduce" => "line_items#reduce_quantity", as: "line_item_reduce"
  post "line_items" => "line_items#create"
  get "line_items/:id" => "line_items#show", as: "line_item"
  delete "line_items/:id" => "line_items#destroy"

  resources :products
  resources :orders

  devise_for :users, controllers: { registrations: "users/registrations" }, path: "/", path_names: { sign_in: "log_in",
                                                                                                     sign_out: "logout",
                                                                                                     password: "secret",
                                                                                                     confirmation: "verification",
                                                                                                     unlock: "unblock",
                                                                                                     sign_up: "sign_up" }


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end