Rails.application.routes.draw do

  resources :cohorts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/signup', to: 'users#new'

  get '/login', to:'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :reviews
  resources :restaurants
  resources :users

end
