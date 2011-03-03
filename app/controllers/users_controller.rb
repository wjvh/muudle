class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  before_filter :admin_user,   :only => :destroy

  def destroy
    User.find_by_name(params[:id]).destroy
    flash[:success] = "User removed."
    redirect_to :back
  end

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find_by_name(params[:id])
    @title = @user.name
    @micropost = Micropost.new if user_signed_in?
    @microposts = @user.microposts.paginate(:page => params[:page], :per_page => 12)

    @friends = @user.following & @user.followers
  end

  def following
    @user = User.find_by_name(params[:id])
    @title = "Following"
    @users = @user.following.paginate(:page => params[:page])
    render 'show_follow'
  end

  def followers
    @user = User.find_by_name(params[:id])
    @title = "Followers"
    @users = @user.followers.paginate(:page => params[:page])
    render 'show_follow'
  end

  def name_redirect
     redirect_to users_path(@user)
  end

private

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
