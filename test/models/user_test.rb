require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(fname: "Abe", lname: "Const", email: "123@hotmail.com",
                    password: "123")
  end
  test "should be valid" do
    assert @user.valid?
  end

  test "first name should not be empty" do
    @user.fname = ''
    assert_not @user.valid?
  end

  test "last name should not be empty" do
    @user.lname = ''
    assert_not @user.valid?
  end

  test "email should not be empty" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "password should not be empty" do
    @user.password = ''
    assert_not @user.valid?
  end
end
