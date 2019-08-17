class UsersController < ApplicationController
	def show
    @user = User.find(params[:id]) #params[:id] => /users/1 の1?
	end

  # 
  def new
    @user = User.new
  end

  # フォームの入力処理
  def create
    #     = User.new(name: ~~~ , email: ~~~, password: ~~~
    #                password_confirmation: ~~~)
    # @user = User.new(params[:user])
    @user = User.new(user_params)
    if @user.save # 登録成功したら
      flash[:success] = "Welcome to the sample App!" # redirect先でwelcomeメッセを１回だけ表示
      # 新規userページへリダイレクト
      redirect_to @user # = redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
