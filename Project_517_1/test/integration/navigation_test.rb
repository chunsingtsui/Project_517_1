require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "Log in and view posts index" do
    get "log_in"
    assert_response :success

    post_via_redirect "/user_sessions", {:username => "admin", :password => "admin"}
    assert_equal '/view_posts', path
  end

  test "Log in and manage users" do
    get "log_in"
    assert_response :success

    post_via_redirect "/user_sessions", {:username => "admin", :password => "admin"}
    assert_equal '/view_posts', path

    get "manage_users"
    assert_response :success
  end

  test "Log in and edit categories" do
    get "log_in"
    assert_response :success

    post_via_redirect "/user_sessions", {:username => "admin", :password => "admin"}
    assert_equal '/view_posts', path

    get "edit_categories"
    assert_response :success
  end

  test "should not be able to create post if not logged in" do
    get "/create_a_post"
    assert_redirected_to "/register"
  end

  test "should be able to create post if logged in" do
    get "log_in"
    assert_response :success

    post_via_redirect "/user_sessions", {:username => "nonadmin", :password => "nonadmin"}
    assert_equal '/view_posts', path

    get "/create_a_post"
    assert_equal "/create_a_post", path
  end
end