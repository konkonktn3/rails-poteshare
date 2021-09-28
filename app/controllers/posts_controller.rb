class PostsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def index #ポストしたものを一覧表示（みんな）
    @posts = Post.all
  end

  def new #ポスト(ルーム)を新規登録
    @post = Post.new
  end
  
  def create #ポストをDBに登録
    @post = Post.new(params.require(:post).permit(:roomname, :introduction, :price, :address, :image))
    if @post.save
      flash[:notice] = "新しいルームを登録しました"
      redirect_to ("/posts/#{@post.id}")
    else
      render "posts/new"
    end
  end

  def show #登録したポストを表示（個人）
    @post = Post.find(params[:id])
  end

end
