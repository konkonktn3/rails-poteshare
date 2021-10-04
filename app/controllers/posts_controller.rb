class PostsController < ApplicationController
  before_action :logged_in_user, only:[ ]
  skip_before_action :login_required, only:[:search, :show]

  def index #ユーザがポストしたものを一覧表示
    @posts = current_user.posts
  end

  def new #ポスト(ルーム)を新規登録
    @post = Post.new
  end
  
  def create # ポストをDBに登録
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "新しいルームを登録しました"
      redirect_to ("/posts/#{@post.id}")
    else
      render "posts/new"
    end
  end

  def show # 登録したポストを表示（個人）
    @post = Post.find(params[:id])
  end

  def search
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "ルーム情報を更新しました"
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:notice] = "ルーム登録を削除しました"
    redirect_to :posts
  end

  private
  def post_params
    params.require(:post).permit(:roomname, :introduction, :price, :address, :image)
  end

end