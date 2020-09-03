class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  scope :retweets_for_me, -> (user) { where(user_id:user.followings.ids)}
end
