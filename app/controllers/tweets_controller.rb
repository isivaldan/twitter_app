class TweetsController < ApplicationController
  def dashboard
   
    @tweets = Tweet.all
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
    redirect_to tweets_dashboard_path
  end

  private
  def tweet_params
      params.require(:tweet).permit(:content,:likes,:retweets,:user_id)
    end
  def set_tweet
    @tweet = tweet.find(params[:id])
  end

end
