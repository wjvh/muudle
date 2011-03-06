module PagesHelper

 def home
    @micropost = Micropost.new
    @feed_items = current_user.feed.paginate(:page => params[:page])
 end

end
