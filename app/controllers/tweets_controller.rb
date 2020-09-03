class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit,:update,:destroy]

  def dashboard

   if current_user
    
   @tweets =Tweet.tweets_for_me(current_user)
   # @tweets =Tweet.all
   @retweets =Retweet.retweets_for_me(current_user)
   @tweets.each do |tweet|
    puts "ESTOS SON TWEETS #{tweet.user.name}"
   end
    #@retweets =Retweet.all
    organized_pages
    @tweet= Tweet.new
    @currentUser = current_user.id
    else
      redirect_to user_session_path
    end
    
   
  end

  def new
    @tweet= Tweet.new
    @currentUser = current_user.id
  end

  def show
    @likes = Like.all
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
  def index
   
   @tweet =Tweet.find_by(id:params[:format])
   @likes = Like.where(user: current_user, tweet: @tweet)
   # @reweets = Retweet.where(tweet_id:@tweet.id)
  end
  def organized_pages
    
    @tweets = Tweet.order(:created_at).page params[:page]
  end

  private

  def tweet_params
      params.require(:tweet).permit(:content,:likes_count,:retweets_count,:user_id)
    end
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
