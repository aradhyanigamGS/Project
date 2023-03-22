Rails.application.routes.draw do
  devise_for :registers

  root to: "home#index"
  
  get 'hr',to: "home#hr"  #to get the 
  post 'hr', to: "home#hr"

  resources :applicants


end
