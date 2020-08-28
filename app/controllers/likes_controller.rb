class LikesController < ApplicationController
  def new
     tweet =Tweet.find_by(id: params[:id])
     Like.create(user_id:params[tweet.user_id], user_id:params[tweet.id])
     tweet.likes+=1
     tweet.save
  end
end
