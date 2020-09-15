class UsersController < ApplicationController
  def my_tweets
    @tweets = current_user.tweets
  end
  def user_list
    @users =User.all
  end
end
