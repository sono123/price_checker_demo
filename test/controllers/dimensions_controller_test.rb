require 'test_helper'

class DimensionsControllerTest < ActionController::TestCase
  setup do
    @dimension = dimensions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dimensions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dimension" do
    assert_difference('Dimension.count') do
      post :create, dimension: { height: @dimension.height, width: @dimension.width }
    end

    assert_redirected_to dimensions_path
  end

  test "should show dimension" do
    get :show, id: @dimension
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dimension
    assert_response :success
  end

  test "should update dimension" do
    patch :update, id: @dimension, dimension: { height: @dimension.height, width: @dimension.width }
    assert_redirected_to dimensions_path
  end

  test "should destroy dimension" do
    assert_difference('Dimension.count', -1) do
      delete :destroy, id: @dimension
    end

    assert_redirected_to dimensions_path
  end
end
