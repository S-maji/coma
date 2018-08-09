class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @post.favorite!(current_user)
    redirect_to :back
  end

  def destroy
    @post = Favorite.find(params[:id]).post
    @post.unfavorite!(current_user)
    redirect_to :back
  end
  
  def index
    @user = User.find(params[:id])
    @posts = @user.favorite_posts.page(params[:page]).per(12)
  end
end
