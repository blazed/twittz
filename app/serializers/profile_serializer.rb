class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :handle, :bio, :name, :total_posts, :location

  has_many :posts

  def handle
    object.user.handle
  end

  def name
    object.name if current_user
  end

  def bio
    object.bio if current_user
  end

  def total_posts
    object.posts.count if current_user
  end

  def location
    object.location if current_user
  end
end
