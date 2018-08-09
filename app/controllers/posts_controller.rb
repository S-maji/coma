class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = current_user.posts.build
  end
  
  def edit
  end
  
  def create
    @post = current_user.posts.build(post_params)
      if @post.title == ""
        @post.title = "無題"
      end
      if @post.save
        flash["success"] = "投稿しました！"
        redirect_to root_path
      else
        render 'posts/new'
      end
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash["success"] = "投稿を削除しました"
    redirect_to root_path
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @reaction = @post.reactions.build
    @reactions = @post.reactions.all
    if @post == nil
      flash["error"] = "該当する投稿はありません。" 
      redirect_to root_path
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :comment, :image_1, :image_2, :image_3)
    end
end
