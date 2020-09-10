class Tweet < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :likes
	has_many :retweets
  paginates_per 50
  
  scope :tweets_for_me, -> (ids) { where(user_id: ids)}

 #scope :last_user_retweet, ->(ids) { maximum(created_at:) }
end
