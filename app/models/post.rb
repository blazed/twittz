class Post < ActiveRecord::Base
  belongs_to :profile

  validates :text, presence: true
end
