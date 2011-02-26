class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]

  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
    @newMood = params[:user][:mood] if params[:user] and params[:user][:mood]
    if @newMood and @newMood != @user.mood and @user.update_attribute(:mood,@newMood)
      flash[:success] = "Profile updated."
    end
  end
end
