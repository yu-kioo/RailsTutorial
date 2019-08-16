# 統合テスト：ページ間の遷移テスト

require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  test "layout links" do
    # staticページのチェック
    get root_path # rootにアクセス
    assert_template 'static_pages/home' # rootが正か
    # aタグのhrefにルートurlが指定されているか
    assert_select "a[href=?]", root_path, count: 2 # root_path * 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    # userページのチェック
    get signup_path
    assert_template 'users/new'
    
  end
end
