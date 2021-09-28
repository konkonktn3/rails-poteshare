class UsersController < ApplicationController

  def new #新規ユーザーアカウントを作る
    @user = User.new
  end

  def create #ユーザーをDBに登録する
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "アカウントが登録されました"
      redirect_to ("/users/#{@user.id}")
    else
      render "users/new"
    end
  end

  def show #個人ユーザー情報
    @user = User.find(params[:id])
  end

  def edit #個人ユーザー情報の編集
    @user = User.find(params[:id])
  end

  def update #個人ユーザー情報の更新
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "情報を更新されました"
        redirect_to ("/users/#{@user.id}")
      else
        render "edit"
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

end
