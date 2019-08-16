require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # 新規のuser_obj作成
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                    password: "foobar", password_confirmation: "foobar") # has_secure_pass対応
  end

  # user_objが有効に生成されているか
  test "should be valid" do
    assert @user.valid? # validation実行
  end

  # 空でないか
  test "name should be present" do
    @user.name = "  "
    assert_not @user.valid? # validationがfalseの場合green
  end
  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  # 文字数
  test "name should not be too long" do
    @user.name = "a" *51
    assert_not @user.valid?
  end
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # 正規表現でのvalidation
  test "email validation should accept valid address" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org 
                        first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid."
    end
  end

  # メアドの一意性
  test "email address should be unique" do
    duplicate_user = @user.dup # dup：objの複製
    duplicate_user.email = @user.email.upcase # メアドは大・小文字識別しないから、
    @user.save
    assert_not duplicate_user.valid? # saveしたobjと複製が同一でないか
  end

  # メアドが小文字でDB格納されるか
  test "email address should be saved as lower-case" do
    mixed_case_email = "Foo@ExaMple.Com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email # 両者が一致しているか
    #                                      =Model.find(@user.email)
  end

  # passが空でないか
  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " "  * 6
    assert_not @user.valid?
  end
  # passの最小文字数
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
