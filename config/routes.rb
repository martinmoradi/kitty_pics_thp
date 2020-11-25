Rails.application.routes.draw do
  root "products#index"

  
  resources :carts
  resources :products do 
    resources :line_items
  end
  
  resources :orders
  resources :charges
  devise_for :users, controllers: { registrations: "users/registrations" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
