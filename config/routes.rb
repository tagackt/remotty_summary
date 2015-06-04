Rails.application.routes.draw do

  devise_for :users
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
  #   get 'sign_out', :to => 'users/sessions#destroy', :as => :destroy_user_session
  # end

  # get 'home/index'
  root 'home#index'

  get '/auth/remotty/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'

  # get 'users/auth/remotty/callback' => 'sessions#create'


end
