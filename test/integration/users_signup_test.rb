require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  # 無効な登録
	test 'invalid signup infomation' do
    get signup_path
    # user数が一致するか
		assert_no_difference 'User.count' do
			post users_path,
			     params: {
					user: {
						name: '',
						email: 'user@invalid',
						password: 'foo',
						password_confirmation: 'bar'
					}
			     }
    end
    # renderされたtemplateが一致するか
    assert_template 'users/new'
    # errormessageのテスト
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  # 有効な登録
  test "valid signup infomation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {name: "Example User",
                                        email: "user@example.com",
                                        password: "password",
                                        password_confirmation: "password"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end
  
end
