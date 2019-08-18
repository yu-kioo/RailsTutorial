module SessionsHelper
	# 受け取ったユーザーでログイン
  def log_in(user)
    # ブラウザのcookieに暗号化ずみのユーザーidを生成
    # cookiesメソッドと違い、sessionメソッドでのcookieはブラウザ終了時に削除される
		session[:user_id] = user.id 
  end

  # login中のユーザーをDBから取り出す(最初の１回だけ)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])

    #↑と同じ
    # @current_user = @current_user || User.find_by(id: session[:user_id])

    # if @current_user.nil?
    #   @current_user = User.find_by(id: session[:user_id])
    # else
    #   @current_user
    # end
  end

  # loginしていればtrue, していなければfalse
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
