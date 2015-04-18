class StaticPagesController < ApplicationController
  def home
  	@record = current_user.records.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
