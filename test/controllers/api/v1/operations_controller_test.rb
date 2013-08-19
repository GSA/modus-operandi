require 'test_helper'

class Api::V1::OperationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get full_map" do
    get :full_map
    assert_response :success
  end

end
