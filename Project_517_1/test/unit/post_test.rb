require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "depth_one" do
    assert_equal(posts(:post_with_depth_one).depth, 1)
  end

  test "depth_two" do
    assert_equal(posts(:post_with_depth_two).depth, 2)
  end

  test "depth_three" do
    assert_equal(posts(:post_with_depth_three).depth, 3)
  end

  test "test_get_all_children_posts_no_children" do
    assert_equal(posts(:post_with_depth_three).getAllChildrenPosts.count, 0)
  end

  test "test_get_all_children_posts_two_children" do
    assert_equal(posts(:post_with_depth_one).getAllChildrenPosts.count, 1)
  end

  test "hasChildrenPost_without_child" do
    assert_equal(posts(:post_with_depth_three).hasChildrenPost, false)
  end

  test "hasChildrenPost_with_child" do
    assert_equal(posts(:post_with_depth_one).hasChildrenPost, true)
  end

  test "test_list_voters" do
    assert_equal(posts(:post_by_non_admin).listVoters[0].user_id, 1)
  end

  test "test_get_parent_post_id" do
    assert_equal(posts(:post_with_depth_two).getParentPostID, 1)
  end

  test "test_creator_name" do
    assert_equal(posts(:post_by_admin).creatorName, "admin")
  end

  test "test_category" do
    assert_equal(posts(:post_in_music_category).category, "Music")
  end

  test "test_number_of_votes" do
    assert_equal(posts(:post_by_admin).numberOfVotes, 1)
  end
end