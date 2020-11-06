class PostImagesController < ApplicationController

  # 新規投稿ページ
  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  # 投稿一覧ページ
  def index
    @post_images = PostImage.page(params[:page]).reverse_order
  end

  # 記事詳細ページ
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  # 投稿データの削除
  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path

  end

  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)

  end

end
