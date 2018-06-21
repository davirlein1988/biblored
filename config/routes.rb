Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :libraries
  resources :books

	put 'books/:id/borrow', to: 'books#borrow'
	put 'books/:id/renew', to: 'books#renew'
  
end
