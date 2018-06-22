Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :libraries
    resources :books do 
  	put 'borrow'
	put 'renew'
	get 'search', on: :collection
end
	

  
end
