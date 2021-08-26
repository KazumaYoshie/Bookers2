Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "home/about" => "homes#about"
  resources :books
  resources :users
end
