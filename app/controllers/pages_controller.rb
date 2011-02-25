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
  end

  def about
    @title = "About"
  end

end