Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
=======
  resources :products
>>>>>>> feature/products_table
  root "static#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
