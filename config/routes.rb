Rails.application.routes.draw do
  root 'application#home'
  get '/signup', to: "users#create"
  get "/signin", to: "sessions#sign_in", :as => 'sign_in'
  post '/signin' => 'sessions#create'
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :users
  resources :attractions
end
