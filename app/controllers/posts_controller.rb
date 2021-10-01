class PostsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]
  skip_before_action :login_required, only:[:search, :show]

  def index #ユーザがポストしたものを一覧表示
    @posts = current_user.posts
  end

  def new #ポスト(ルーム)を新規登録
    @post = Post.new
  end
  
  def create # ポストをDBに登録
    @post = current_user.posts.new(params.require(:post).permit(:roomname, :introduction, :price, :address, :image))
    if @post.save
      flash[:notice] = "新しいルームを登録しました"
      redirect_to ("/posts/#{@post.id}")
    else
      render "posts/new"
    end
  end

  def show # 登録したポストを表示（個人）
      @post = current_user.posts.find(params[:id])
  end

  def search
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end

end