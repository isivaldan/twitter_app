class FollowsController < ApplicationController
  def profile
    @tweet =Tweet.find_by(id:params[:format])
    @tweets  = Tweet.tweets_for_me(@tweet.user_id).order('created_at DESC').page params[:page]
      
    @retweets =Retweet.where(user_id:@tweet.user_id)
   
  end

  def create
    
    user_b =User.find_by(id:params[:format])
    if Follow.find_by(following_id:user_b.id,follower_id:current_user.id )
      @destruir= Follow.find_by(following_id:user_b.id,follower_id:current_user.id )
      @destruir.destroy
      @title
      redirect_to root_path
      @title = "Follow"
    else
      Follow.create(following_id:user_b.id,follower_id:current_user.id )
      @title="Followed"
      redirect_to root_path
    end
  end
end
