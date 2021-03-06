Rails.application.routes.draw do
  devise_for :users

  resources :users, only:[:index, :show, :edit, :update]
  resources :books
  get "home/about" => "home#about"

  # / へのルーティング
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end