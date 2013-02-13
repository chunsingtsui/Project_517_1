require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  test "test_exists" do
    vote = Vote.new
    vote.user_id = users(:admin_user).id
    vote.post_id = posts(:post_by_non_admin).id
    assert_equal(vote.exists, true)
  end

  test "test_delete" do
    vote = Vote.new
    vote.user_id = users(:admin_user).id
    vote.post_id = posts(:post_in_music_category).id
    vote.save
    assert_equal(vote.exists, true)
    vote.delete
    assert_equal(vote.exists, false)
  end
end