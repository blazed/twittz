class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :posts, dependent: :destroy
  has_many :followers, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, length: { maximum: 32 }
  validates :location, length: { maximum: 32 }
  validates :bio, length: { maximum: 255 }
end
