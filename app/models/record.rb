class Record < ActiveRecord::Base
	belongs_to :user
	belongs_to :lift
	has_many :comments, as: :commentable
	# default_scope -> { order(created_at: :desc) }

	acts_as_votable

	def score
		if self.get_downvotes.size + self.get_upvotes.size != 0
			self.get_upvotes.size / (self.get_downvotes.size + self.get_upvotes.size) * 100
		else
			puts 0
		end
	end

	def self.feed_scope
		order(created_at: :desc)
	end

	def self.top_4
		order(lift_weight: :desc).first(4)
	end

	validates :user_id, presence: true
	validates :lift_weight, presence: true
  validates_format_of :video_link, :with => URI::regexp(%w(http https)),
  	allow_nil: true

end
