class Record < ActiveRecord::Base
	belongs_to :user
	belongs_to :lift
	# default_scope -> { order(created_at: :desc) }

	def self.feed_scope
		order(created_at: :desc)
	end

	def self.top_4
		order(lift_weight: :desc).first(4)
	end

	validates :user_id, presence: true
	validates :lift_weight, presence: true
  # validates_format_of :video_link, :with => URI::regexp(%w(http https)) # change so you can update this later

end
