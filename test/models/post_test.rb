require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    @post = @user.posts.build(content: "Type content here.", title: "Test Post", artist: "Jack Pontifex", album: "Jackson 5")
  end

  test "post should be valid" do
    assert @post.valid?
  end

  test "post should have an associated user id" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content should have something in it" do
    @post.content = " "
    assert_not @post.valid?
  end

  test "title should be non-empty" do
    @post.title = " "
    assert_not @post.valid?
  end

  test "artist should not be empty" do
    @post.artist = " "
    assert_not @post.valid?
  end

  test "album should not be empty" do
    @post.album = " "
    assert_not @post.valid?
  end

  test "should be in chronological order with most recent first" do
    assert_equal posts(:most_recent), Post.first
  end

end
