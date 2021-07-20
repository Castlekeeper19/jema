require 'test_helper'

class MinistriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ministries_index_url
    assert_response :success
  end

  test "should get show" do
    get ministries_show_url
    assert_response :success
  end

end
