ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :image_url, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :image_url, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    column :email
    column :name
    column :image_url
    column :followings_count do |user|
      user.followings.count
    end
    column :tweets_count do |user|
      user.tweets.count
    end
    column :likes do |user|
      user.likes.count
    end

    column :retweets do |user|
      user.retweets.count
    end

    actions

  end
end
