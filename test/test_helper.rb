ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
# add：テスト結果の表示をわかりやすく
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
	fixtures :all
	include ApplicationHelper

	# テストユーザーがログインしてるか
	def is_logged_in?
		!session[:user_id].nil?
	end
end
