Rails.application.routes.draw do
  root "products#index"

  
  resources :carts
  resources :products do 
    resources :line_items
  end
  
  resources :orders

  devise_for :users, controllers: { registrations: "users/registrations" }, path: "/", path_names: { sign_in: "log_in",
                                                                                                     sign_out: "logout",
                                                                                                     password: "secret",
                                                                                                     confirmation: "verification",
                                                                                                     unlock: "unblock",
                                                                                                     sign_up: "sign_up" }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
