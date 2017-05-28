require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    ##<User id: nil, name: "leijj5", email: "leijj5@example.com", created_at: nil, updated_at: nil, password_digest: nil, remrember_digest: nil, remember_digest: nil>
    #@user = User.find_by(id: 5)
    @user = create(:user)
    #User.find_by(email: "leijj5@example.com")
    #User.new(id: 7, name: "leijj5", email: "leijj5@example.com")
    p "**************start"
    p @user
    p "**************end"
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
