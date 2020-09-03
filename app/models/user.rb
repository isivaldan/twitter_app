class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets
  has_many :like
  has_many :retweets

  has_many :account_following, foreign_key: :follower_id, class_name: "Follow"
  has_many :followings, through: :account_following, source: :following

  has_many :account_follower, foreign_key: :following_id, class_name: "Follow"
  has_many :followers, through: :account_follower, source: :follower
end
