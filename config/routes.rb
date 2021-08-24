Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root 'homes#top'
  resources :books
  resources :users
end
