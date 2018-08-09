class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.page(params[:page]).per(12) if @user
    if @user == nil
      flash["error"] = "該当するユーザーが見つかりません。"
      redirect_to root_path
    end
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.followed_users.page(params[:page]).per(12)
    render 'follow_users'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(12)
    render 'follow_users'
  end
end
