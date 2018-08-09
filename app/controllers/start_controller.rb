class StartController < ApplicationController
  def home
    if signed_in?
      @user = current_user
      @posts = current_user.posts.page(params[:post_page]).per(8)
      @followed_user_posts = current_user.feed.page(params[:new_page]).per(5)
    end
    @all_posts = Post.where(created_at: (24.hour.ago)..(Time.now)).page(params[:follow_page]).per(5)
  end
end
