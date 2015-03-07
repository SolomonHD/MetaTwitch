require 'test_helper'

class TwitchControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "test show" do
    get :show, id:"dota 2"
    assert_response :success
  end

end
