class Post < ActiveRecord::Base
  belongs_to :profile
  has_many :likes, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :body, presence: true
end
