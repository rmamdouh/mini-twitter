class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :posts, :dependent => :destroy
  has_many :relationships, :foreign_key => 'follower_id', :dependent => :destroy
  has_many :followeds, :through => :relationships

  has_many :reverse_relationships, :class_name => Relationship, :foreign_key => 'followed_id', :dependent => :destroy
  has_many :followers, :through => :reverse_relationships

  def follow(follower_id, followed_id)
    if (!following?(follower_id, followed_id))
      #self.relationships.create!(:follower_id => id.to_i)
      self.relationships.create!(:follower_id => follower_id.to_i, :followed_id => followed_id.to_i)
    end
  end

  def unfollow(follower_id, followed_id)
    if (following?(follower_id, followed_id))
      #self.relationships.where(:follower_id => id.to_i).destroy_all
      self.relationships.where(:follower_id => follower_id.to_i, :followed_id => followed_id.to_i).destroy_all
    end
  end

  def following?(follower_id, followed_id)
    !self.relationships.where(:follower_id => follower_id.to_i, :followed_id => followed_id.to_i).blank?
  end
end
