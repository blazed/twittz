class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :handle, :bio, :name

  def handle
    object.user.handle
  end
end
