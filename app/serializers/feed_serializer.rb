class FeedSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :updated_at, :likes_count, :author

  def likes_count
    object.likes.count
  end

  def author
    object.profile.user.handle
  end
end
