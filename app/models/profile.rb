class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :posts, dependent: :destroy
  has_many :followers, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
end
