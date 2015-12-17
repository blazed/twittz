class Like < ActiveRecord::Base
  belongs_to :post
  belongs_to :profile

  validates :post_id, presence: true
  validates :profile, presence: true
end
