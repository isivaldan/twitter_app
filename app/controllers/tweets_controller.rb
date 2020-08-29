class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit,:update,:destroy, :complete]
  def dashboard
   
    @tweets = Tweet.all
    @retweets =Retweet.all
    @tweets = Tweet.order(:created_at).page params[:page]
    if current_user
      @tweet= Tweet.new

      @currentUser = current_user.id
    end
  end

  def new
    @tweet= Tweet.new
    @currentUser = current_user.id
  end

  def show

  end
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update

  end
  def destroy
    @tweet.destroy
    redirect_to users_my_tweets_path
  end

  private
  def tweet_params
      params.require(:tweet).permit(:content,:likes_count,:retweets_count,:user_id)
    end
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
