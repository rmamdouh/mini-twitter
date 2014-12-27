class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :content

  def delete(post_id)
    self.posts.where(:id => post_id.to_i).destroy_all
  end

end
