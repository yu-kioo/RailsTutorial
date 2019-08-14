require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # 各テストが実行される直前で実行される特殊なメソッド
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App" # 共通文字を変数化
  end

  test 'should get home' do
    # homeのページが表示されるか(=view,router,controllerに記載があるか)
    get static_pages_home_url
    assert_response :success
    # htmlのタグ内に指定文字列が存在するか
    assert_select "title", "Home | #{@base_title}"
	end

	test 'should get help' do
		get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
	end

	test 'should get about' do
		get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test 'should get contact' do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
  
end
