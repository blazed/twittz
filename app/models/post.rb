class Post < ActiveRecord::Base
  belongs_to :profile

  default_scope -> { order(created_at: :desc) }

  validates :body, presence: true
end
