class RenameRetweetsToTweet < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :retweets, :retweets_count
  end
end
