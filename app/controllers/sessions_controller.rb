class SessionsController < ApplicationController
  skip_before_action :login_required
  
  def new
  end
  
#ログイン処理
  def create
    user=User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id]=user.id
      flash[:success] = 'ログインしました'
      redirect_to ('/top')
    else
      flash.now[:danger] = 'メールアドレスかパスワードが間違っています。'
      render 'new'
    end
  end

#ログアウト処理
  def destroy
    reset_session
    redirect_to ('/top')
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
