class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit,:update,:destroy]
  acts_as_token_authentication_handler_for User
  def dashboard

   if !current_user
    @q = Tweet.ransack(params[:q])
    @tweets = @q.result.order('created_at DESC').page params[:page]

    @retweets =Retweet.all
   else
    @q = Tweet.tweets_for_me(current_user.followings.pluck(:id)).ransack(params[:q])
    @tweets = @q.result.order('created_at DESC').page params[:page]

    @retweets =Retweet.retweets_for_me(current_user)
   
    @tweet= Tweet.new
    @currentUser = current_user.id
  
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
  def search
    
    @q= Tweet.ransack(content_cont_any:  params[:search])
    @tweets = @q.result
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
  

  private

  def tweet_params
      params.require(:tweet).permit(:content,:likes_count,:retweets_count,:user_id)
  end
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

end
