class UsersController < ApplicationController
  def my_tweets
    @tweets = current_user.tweets
  end
end
