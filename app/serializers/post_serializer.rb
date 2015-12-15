class PostSerializer < ActiveModel::Serializer
  attributes :id, :profile_id, :body, :created_at, :updated_at, :likes_count

end
