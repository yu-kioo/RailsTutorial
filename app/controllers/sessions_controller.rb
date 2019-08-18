class SessionsController < ApplicationController
	def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # 入力passとhash_passを比較
    if user && user.authenticate(params[:session][:password])
      # ログイン後にユーザーページにリダイレクト
      log_in(user)
      redirect_to user
      # = redirect_to user_url(user)
    else
      flash.now[:danger] = "Invalid email/password conbination" # .now：ページ遷移後、メッセージ削除
      render 'new'
    end
	end

  def destroy
    log_out
    redirect_to root_url
  end
end
