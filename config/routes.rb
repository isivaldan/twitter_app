Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'tweets#dashboard'
  get 'tweets/new'
  get "tweets(?search=:search)", to: 'tweets#search', as:'search'
  get 'users/my_tweets'
  get 'users/user_list'

  get 'api/news/', to: "apis#get_last_tweets"
  post 'api/tweets/', to: "apis#post_my_tweet"
  get '/api/:from/:to', to:'apis#date_filter'
  get 'follows/profile', to: 'follows#profile'
  post '/follows', to: 'follows#create'
  resources :tweets
  resources :likes
  resources :retweets
  devise_for :users
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
