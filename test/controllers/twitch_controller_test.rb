require 'test_helper'

class TwitchControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "test show" do
    get :show
    assert_response :success
  end

end
