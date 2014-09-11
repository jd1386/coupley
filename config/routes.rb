Rails.application.routes.draw do
 
  root 'home#index'

  devise_for :users
	
	devise_scope :user do
		get '/signin', to: 'devise/sessions#new', as: 'signin'
		get '/signup', to: 'devise/registrations#new', as: 'signup'
	end

 

 

end
