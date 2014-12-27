class RelationshipsController < ApplicationController
    def create
        if (params['commit'] == 'Follow')
	  current_user.follow(current_user.id, params['relationship']['followed_id'])
	  #redirect_to "/users/#{current_user.id}"
          redirect_to(:back)
        elsif (params['commit'] == 'UnFollow')
          current_user.unfollow(current_user.id, params['relationship']['followed_id'])
          #redirect_to "/users/#{current_user.id}"
          redirect_to(:back)
        end
    end
end
