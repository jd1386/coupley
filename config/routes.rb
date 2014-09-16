Rails.application.routes.draw do
 
root 'home#index'

devise_for :users

devise_scope :user do
	get '/signin', to: 'devise/sessions#new', as: 'signin'
	get '/signup', to: 'devise/registrations#new', as: 'signup'
end

resources :users do
	resources :posts
end

get 'posts/filter/:scope', to: 'posts#index', as: :filtered_posts

resources :posts do
		resources :replies
end 

resources :albums 


end
