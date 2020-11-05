class PostCommentsController < ApplicationController

  # コメントの保存
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    # 上の１行は以下２行を省略したもの
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  # コメントの削除
  def destroy
    comment = PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id])
    comment.destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
