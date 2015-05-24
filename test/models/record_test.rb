require 'test_helper'

class RecordTest < ActiveSupport::TestCase

	def setup
		@user = users(:Michael)
		@lift = lifts(:squat)
		@record = @user.records.build(lift_weight: 300, lift_id: 1)
	end

	test "should be valid" do
		assert @record.valid?
	end

	test "user id should be present" do
		@record.user_id = nil
		assert_not @record.valid?
	end

	test "lift weight should not be blank" do
		@record.lift_weight = nil
		assert_not @record.valid?
	end
end
