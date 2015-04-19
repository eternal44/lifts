class StaticPagesController < ApplicationController
  def home
  	if logged_in?
	  	@record = current_user.records.build
	  	@feed_items = current_user.feed.paginate(page: params[:page])
	  end
  end

  def help
  end

  def about
  end

  def contact
  end
end
