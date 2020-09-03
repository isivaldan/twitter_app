class Tweet < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :likes
	has_many :retweets
  paginates_per 50

  scope :tweets_for_me, -> (user) { where(user_id:user.followings.ids)}
end
