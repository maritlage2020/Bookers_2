Rails.application.routes.draw do
  devise_for :users

  resources :users, only:[:index, :show, :edit, :update]
  resources :books
  get "about" => "root#about"

  # / へのルーティング
  root 'root#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end