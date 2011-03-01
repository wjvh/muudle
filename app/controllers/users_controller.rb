class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find_by_name(params[:id])
    @title = @user.name
    @micropost = Micropost.new if user_signed_in?
    @microposts = @user.microposts.paginate(:page => params[:page])
  end

  def name_redirect
     redirect_to users_path(@user)
  end
end
