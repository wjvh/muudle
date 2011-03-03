class PagesController < ApplicationController

  layout :choose_layout
  private
  def choose_layout    
    if [ 'home' ].include? action_name
       'frontPage'
    else
       'application'
    end
  end

  def home
    @title = "Home"
    if signed_in?
      @micropost = Micropost.new
      @feed_items = current_user.feed.paginate(:page => params[:page])
    end
  end

  def about
    @title = "About"
  end

end
