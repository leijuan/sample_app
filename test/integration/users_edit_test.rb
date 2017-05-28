require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    #@user = users(:michael)
    @user = User.new(name: "leijj5", email: "leijj5@example.com")
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end
