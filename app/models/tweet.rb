class Tweet < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  has_many :likes
	has_many :retweets
  paginates_per 50
end
