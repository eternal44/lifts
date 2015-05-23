class RecordsController < ApplicationController
	before_action :current_user, only: [:show, :destroy]
	before_action :correct_user, only: [:destroy, :edit]


	def upvote
		@record = Record.find(params[:id])
		@record.upvote_by current_user
		redirect_to record_path
	end

	def downvote
		@record = Record.find(params[:id])
		@record.downvote_by current_user
		redirect_to record_path
	end

	def create
		@record = current_user.records.build(record_params)
		if @record.save
			flash[:success] = "Record created!"
			redirect_to root_url
		else
			@feed_items = []
			@top_4 = []
			render 'static_pages/home'
		end
	end

	def show
		@record = Record.find(params[:id])
		@test = "hello"
	end

	def edit
		@record = Record.find(params[:id])
	end

	def update
		@record = Record.find(params[:id])
		if @record.update_attributes(record_params)
			flash[:success] = "Video validation updated"
			redirect_to root_url
		else
			render 'edit'
		end
	end

	def destroy
		@record.destroy
		flash[:success] = "Record deleted"
		redirect_to request.referrer || root_url
	end

	def index
		@records = Record.all
    @top_4 = Record.find_each(lift_id: 2)

	end

		private

			def record_params
				params.require(:record).permit(:lift_weight, :lift_id, :video_link, :record_id, :commentable_id)
			end

			def correct_user
				@record = current_user.records.find_by(id: params[:id])
				redirect_to root_url if @record.nil?
			end
end
