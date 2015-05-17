class Records::CommentsController < CommentsController
	before_action :set_commentable

	private

		def set_commentable
			@commentable = Record.find(params[:record_id])
		end
end