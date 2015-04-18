class Record < ActiveRecord::Base
	belongs_to :user
	belongs_to :lift
	default_scope -> { order(created_at: :desc) }

	validates :user_id, presence: true
	validates :lift_weight, presence: true
end
