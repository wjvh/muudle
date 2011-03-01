class MicropostsController < ApplicationController
  before_filter :authenticate_user!

  def create
   @user_of_page = User.find_by_name(params[:id]) 
   @micropost = @user_of_page.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to :back
    else
      redirect_to about_path
    end
  end

  def destroy
  end
end
