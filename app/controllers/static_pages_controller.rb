class StaticPagesController < ApplicationController
	
  def home
    if logged_in?
      @task  = current_user.tasks.build
      @taskFeed_items = current_user.importantTasksfeed.paginate(page: params[:page])
    end
  end

  def help
  end
	
  def about
  end
	
  def contact
  end
end
