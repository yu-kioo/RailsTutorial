Rails.application.routes.draw do

	# REST
	resources :users # RESTのリソースとしてuserの情報を使用する(/users/1)

  get 'sessions/new'
	root 'static_pages#home'
	# この形でルートURLを定義することで、(root)_path,(root)_urlがviewで使用可能
	get '/help',      to: 'static_pages#help'
	get '/about',     to: 'static_pages#about'
	get '/contact',   to: 'static_pages#contact'
	get '/signup',    to: 'users#new'
	post '/signup',   to: 'users#create'
	# session
	get '/login',     to: 'sessions#new'
	post '/login',    to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
end
