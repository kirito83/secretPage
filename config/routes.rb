Rails.application.routes.draw do
	root to: 'static_pages#home'
	resources :users
	get    	'/secret', 						to: 'static_pages#secret', as: 'secret'
	get    	'/login',   					to: 'sessions#login'
  	post   	'/login',   					to: 'sessions#create_login'
  	delete 	'/logout',  					to: 'sessions#destroy'
  	get 	'/sessions/:id/edit(.:format)',	to: 'sessions#edit', as: 'edit'
  	post	'/edit',						to: 'sessions#update'
  	get		'/signup',						to: 'sessions#new', as: 'signup'
  	post	'/signup',						to: 'sessions#create'
end
