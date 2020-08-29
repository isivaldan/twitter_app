class RetweetsController < ApplicationController
 
  def new
    @retweet= Retweet.new
  end
  def create
    tweet =Tweet.find_by(id:params[:format])
    if Retweet.find_by(user_id:current_user.id,tweet_id:tweet.id )
      @destruir= Retweet.find_by(user_id:current_user.id,tweet_id:tweet.id)
      @destruir.destroy
      tweet.retweets_count-=1
      tweet.save
      redirect_to root_path
    else
      Retweet.create(user_id:current_user.id, tweet_id:tweet.id)
      tweet.retweets_count+=1
      tweet.save
      redirect_to root_path
    end
  end

 
  def destroy
  end
  def show
    @reweets = Retweet.all
  end



end
