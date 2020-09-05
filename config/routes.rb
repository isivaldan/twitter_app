Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'tweets#dashboard'
  get 'tweets/new'
  get 'users/my_tweets'
  get 'tweets/tweet_search'
  get 'follows/profile', to: 'follows#profile'
  post '/follows', to: 'follows#create'
  resources :tweets
  resources :likes
  resources :retweets
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
