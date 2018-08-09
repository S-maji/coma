class ReactionsController < ApplicationController
    before_action :authenticate_user!
    
    def create
      @post = Post.find(params[:id])
      @reaction = @post.reactions.build(reaction_params)
      if @reaction.save
        flash["success"] = "コメントしました"
        redirect_to :back
      else
        flash["error"] = "コメントの保存に失敗しました"
        redirect_to :back
      end
    end
    
    private
    
        def reaction_params
            params.require(:reaction).permit(:post_id, :comment, :user_id)
        end

end
