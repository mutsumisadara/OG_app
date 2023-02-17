require "test_helper"

class CommentRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comment_rooms_index_url
    assert_response :success
  end
end
