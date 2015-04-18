class Lift < ActiveRecord::Base
	has_many :records, dependent: :destroy
	has_many :users, through: :records, dependent: :destroy
end
