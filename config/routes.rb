Rails.application.routes.draw do
	root to: 'static_pages#home'
	resources :users
	post	'/users/new', 	to: 'users#create'  
	get    	'/secret', 		to: 'static_pages#secret', as: 'secret'
	get    	'/login',   	to: 'sessions#new'
  	post   	'/login',   	to: 'sessions#create'
  	delete 	'/logout',  	to: 'sessions#destroy'
end
