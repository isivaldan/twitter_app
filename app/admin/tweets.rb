ActiveAdmin.register Tweet do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :content, :likes_count, :retweets_count, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:content, :likes_count, :retweets_count, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do
    def destroy
      @tweet = Tweet.find(params[:id])
      @tweet.destroy
      redirect_to edit_admin_retailer_path(@tweet.user)
    end
  end
  
end
