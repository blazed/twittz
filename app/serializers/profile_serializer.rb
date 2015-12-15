class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :handle, :bio, :name, :posts_count, :location, :followers_count, :followed_count

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

  def posts_count
    object.posts.count if current_user
  end

  def location
    object.location if current_user
  end

  def followers_count
    object.followers.count  if current_user
  end

  def followed_count
    object.user.followed_profiles.count
  end
end
