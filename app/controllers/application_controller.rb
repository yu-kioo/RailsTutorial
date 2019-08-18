# 各コントローラーの親となるクラス
class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	# session用のhelper読み込み(=全controllerで使用可)
	include SessionsHelper
end
