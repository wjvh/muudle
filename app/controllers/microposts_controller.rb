class MicropostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorized_user, :only => :destroy

  def edit
    if params[:micropost][:agree] == "1"
      @micropost = Micropost.find(params[:micropost][:id])
      @newAgree = 1
      @newAgree+=@micropost.agree
      @micropost.update_attribute(:agree,@newAgree)
      redirect_to :back
    elsif params[:micropost][:disagree] == "1"
      @micropost = Micropost.find(params[:micropost][:id])
      @newDisagree = 1
      @newDisagree+=@micropost.disagree
      @micropost.update_attribute(:disagree,@newDisagree) 
      redirect_to :back
    else
      @micropost = Micropost.find(params[:micropost][:id])
      @newAmused = 1
      @newAmused+=@micropost.amused
      @micropost.update_attribute(:amused,@newAmused)   
      redirect_to :back
    end
  end

  def create
   @user_of_page = User.find(params[:micropost][:belongs_to_id]) 
   @micropost = @user_of_page.microposts.build(params[:micropost])

    if @micropost.save
     
      #Update User mood from submitted micropost mood
      @newUserMood = params[:micropost][:mood]
      @user_of_page.update_attribute(:mood,@newUserMood)

      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @micropost.destroy
    redirect_to :back
  end

private

    def authorized_user
      @micropost = Micropost.find(params[:id])
      redirect_to root_path unless current_user.name == @micropost.user.name || current_user.name == @micropost.author
    end
end
