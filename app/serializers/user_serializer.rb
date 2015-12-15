class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :handle

  has_one :profile, serializer: ProfileSerializer
end
