require 'test_helper'

class ChurchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get churches_index_url
    assert_response :success
  end

  test "should get show" do
    get churches_show_url
    assert_response :success
  end

  test "should get new" do
    get churches_new_url
    assert_response :success
  end

  test "should get update" do
    get churches_update_url
    assert_response :success
  end

end
