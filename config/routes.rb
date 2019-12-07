Rails.application.routes.draw do
  devise_for :users
  	get 'user/sign_up' => 'devise/registrations#new'

  get 'userinfos/new'
  get '/about' => "book#about"

  root 'root#top'

	resources :users, only: [:index,:show, :edit,:update]
	resources :books
	resources :book_images,only:[:new,:create,:index,:show]

end
