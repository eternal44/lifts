class RecordsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
		@record = current_user.records.build(record_params)
		if @record.save
			flash[:success] = "Record created!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end

		private

			def record_params
				params.require(:record).permit(:lift_weight, :lift_id)
			end
end
