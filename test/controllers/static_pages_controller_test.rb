require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Price Checker Website"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | Price Checker Website"
  end

  test "should get about" do
  	get :about
  	assert_response :success
  	assert_select "title", "About | Price Checker Website"
  end

  test "should get contact" do
  	get :contact
    assert_redirected_to login_url
  	# assert_response :success
  	# assert_select "title", "Contact | Price Checker Website"
  end

end























