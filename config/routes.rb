Rails.application.routes.draw do
  root 'base#home'
  post '/filter', to: 'base#filter'
  get '/filter', to: 'base#home'
  get '/signup', to: 'users#signup'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/forum', to: 'forum#show'
  post '/forum', to: 'forum#create'
  get '/showPost', to: 'forum#showPost'
  resources :users
end
