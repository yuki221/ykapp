class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    if @comment.destroy
      redirect_to post_path(@post), notice: '投稿を削除しました'
    else
      redirect_to post_path(@post), alerts: '投稿を削除できませんでした'
    end
   end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
