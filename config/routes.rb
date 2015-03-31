Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :questions

  resources :answers
end
