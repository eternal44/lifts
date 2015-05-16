class Gym < ActiveRecord::Base
  has_many :users
	has_many :comments, as: :commentable
end
