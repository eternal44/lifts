class RecordsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, 	 only: :destroy

	def create
		@record = current_user.records.build(record_params)
		if @record.save
			flash[:success] = "Record created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@record.destroy
		flash[:success] = "Record deleted"
		redirect_to request.referrer || root_url
	end

		private

			def record_params
				params.require(:record).permit(:lift_weight, :lift_id)
			end



			def correct_user
				@record = current_user.records.find_by(id: params[:id])
				redirect_to root_url if @record.nil?
			end
end
