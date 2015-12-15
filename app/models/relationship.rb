class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'Profile'

  validates :follower, presence: true
  validates :followed, presence: true, uniqueness: { scope: :follower_id }
end
