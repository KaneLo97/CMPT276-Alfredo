require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @post = posts(:one)
  end

  test "redirect when not logged in" do
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { title: "A", content: "B", artist: "JC", album: "Best"}}
    end
    assert_redirected_to login_url
  end
end
