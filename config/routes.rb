Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get "home/about" => "homes#about"
  resources :users
  resources :books do
   resources :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
 end
end
