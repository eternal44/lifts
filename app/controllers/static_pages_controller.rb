class StaticPagesController < ApplicationController
  def home
  	if logged_in?
	  	@record = current_user.records.build
	  	@feed_items = current_user.feed.paginate(page: params[:page], per_page: 10).feed_scope
      @top_4 = Record.all.top_4
	  end
  end

  def help
  end

  def about
  end

  def contact
  end
end
