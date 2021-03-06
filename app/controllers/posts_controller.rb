class PostsController < ApplicationController
  load_and_authorize_resource :only => [:destroy]
  
  def create
    Post.create!(:user_id => current_user.id.to_i, :content => params['post']['content'])
    redirect_to(:back)
  end

  def destroy
    Post.delete(params['id'])
    redirect_to(:back)
  end
end
