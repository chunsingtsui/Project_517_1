require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "authenticate_user" do
    assert_equal(User.authenticate("admin", "admin"), users(:admin_user))
    assert_equal(User.authenticate("admin", "nonadmin"), nil)
  end

end