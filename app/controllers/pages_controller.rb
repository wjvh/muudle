class PagesController < ApplicationController

  layout :choose_layout

  def home
    @title = "The Zoo"
    @micropost = Micropost.new
    @feed_items = current_user.feed.paginate(:page => params[:page])

    @friends = current_user.following & current_user.followers
  end

  def frontPage
    @title = "Welcome"
  end

  def about
    @title = "About"
  end

  private
  def choose_layout    
    if [ 'frontPage' ].include? action_name
       'frontPage'
    else
       'application'
    end
  end
end
