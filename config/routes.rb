Rails.application.routes.draw do

  get '/artists', to: 'artists#index'
  get '/artists/:id', to:'artists#show', as: 'artist'
  get 'artists/index'

  get 'artists/show'

  get 'sessions/new'

  root 'welcome#index'
  get "welcome/index"
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/posts', to: 'posts#new'

  resources :users
  resources :posts, only: [:create]
  resources :posts do
    member {post :vote}
  end
  resources :welcome


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
