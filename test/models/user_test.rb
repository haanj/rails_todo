require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "John", email: "john@example.com",
                     password: 'supersecure', password_confirmation: 'supersecure')
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be invalid if name exceeds 50 char" do
    @user.name = "x" * 51
    assert_not @user.valid?
  end

  test 'should be invalid if name missing' do
    @user.name = ""
    assert_not @user.valid?
  end

  test 'should be invalid if email missing' do
    @user.email = ""
    assert_not @user.valid?
  end

  test "should be invalid if email exceeds 255 char" do
    @user.email = "x" * 256
    assert_not @user.valid?
  end

  test "should be invalid if email is not unique" do
    dup_user = @user.dup
    @user.save
    assert_not dup_user.valid?
  end

  test "should save email downcase" do
    mixed_case = "wHat.examPle.cOm"
    @user.email = mixed_case
    @user.save
    @user.reload
    assert_equal mixed_case.downcase, @user.email
  end

  test 'should have password' do
    @user.password = @user.password_confirmation = " " * 8
    assert_not @user.valid?
  end

  test 'should have minimum length' do
    @user.password = @user.password_confirmation = 'x' * 7
    assert_not @user.valid?
  end
end
