class HomesController < ApplicationController
  skip_before_action :login_required
  def top
    @q = Post.ransack(params[:q])
    @posts = @q.result
  end
end
