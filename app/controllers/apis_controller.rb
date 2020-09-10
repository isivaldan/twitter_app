class ApisController < ApplicationController
 
  
  def get_last_tweets
    if Tweet.all
      @tweets =Retweet.all

      
      #@tweets = Retweet.select('tweet_id, MAX(created_at) AS maximo')
      #@tweets = Tweet.left_outer_joins(:retweets)
     # @tweets = Retweet.joins(:tweet).select('tweets.id,tweets.content,tweets.user_id,tweets.likes_count,tweets.retweets_count,retweets.user_id').limit(50)
      render json: @tweets, status: :ok
    else
      render json: {status: "error", code: 3000, message: "Can't find the tweets"}
    end

  end

  #Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")


  def date_filter
    @from = params[:from]
    @to_date = params[:to]
    if Tweet.where('created_at < ? AND created_at > ?', @from, @to_date) 
      @tweets = Tweet.where('created_at < ? AND created_at > ?', @from, @to_date) 
      render json: @tweets, status: :ok
    else
      render json: {status: "error", code: 3000, message: "Can't find the date"}
    end
  end

end