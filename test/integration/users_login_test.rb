require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:Michael)
	end

	test "login with invalid info" do
		
		get new_user_session_path
		assert_template 'sessions/new'
		post user_session_path, session: { email: "", password: "" }
		assert_template 'sessions/new'
		assert_not flash.empty?
		get root_path
		assert flash.empty?
	end

	test "login with valid information" do
	    get new_user_session_path
	    post user_session_path, session: { email: @user.email, password: 'password' }
	    assert_redirected_to @user
	    follow_redirect!
	    assert_template 'users/show'
	    assert_select "a[href=?]", new_user_session_path, count: 0
	    assert_select "a[href=?]", destroy_user_session_path
	    assert_select "a[href=?]", user_path(@user)
	end

	test "valid signup information" do
	    get new_user_registration_path
	    assert_difference 'User.count', 1 do
	      post_via_redirect users_path, user: { name:  "Example User",
	                                            email: "user@example.com",
	                                            password:              "password",
	                                            password_confirmation: "password" }
	    end
	    # assert_template 'users/show'
	    # assert is_logged_in?
  	end

  	test "log out succesful" do
  		get new_user_session_path
  		post login_path, session: { email: @user.email, password: 'password' }
  		assert user_signed_in?
  		assert_redirected_to @user
  		follow_redirect!
  		assert_template 'users/show'
  		assert_select "a[href=?]", new_user_session_path, count: 0
  		assert_select "a[href=?]", destroy_user_session_path
  		assert_select "a[href=?]", user_path(@user)
  		delete destroy_user_session_path
  		assert_not is_user_signed_in?
  		assert_redirected_to root_url
	    # Simulate a user clicking logout in a second window.
	    delete destroy_user_session_path  		
  		follow_redirect!
  		assert_select "a[href=?]", new_user_session_path
  		assert_select "a[href=?]", destroy_user_session_path, 		count: 0
  		assert_select "a[href=?]", user_path(@user), 	count: 0
  	end
	
	test "login with remembering" do
		log_in_as(@user, remember_me: '1')
		assert_not_nil cookies['remember_token']
	end

	test "login without remembering" do
		log_in_as(@user, remember_me: '0')
		assert_nil cookies['remember_token']
	end

end
