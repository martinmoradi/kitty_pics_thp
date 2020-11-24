Rails.application.routes.draw do
  resources :products
  resources :line_items, only: [:create, :update, :destroy]
  resources :carts, except: [:index, :new, :edit]

  devise_for :users, controllers: { registrations: "users/registrations" }

  root "static#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
