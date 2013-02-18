require 'test_helper'

class TilesControllerTest < ActionController::TestCase
  setup do
    @tile = tiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tile" do
    assert_difference('Tile.count') do
      post :create, tile: { type: @tile.type, x: @tile.x, y: @tile.y }
    end

    assert_redirected_to tile_path(assigns(:tile))
  end

  test "should show tile" do
    get :show, id: @tile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tile
    assert_response :success
  end

  test "should update tile" do
    put :update, id: @tile, tile: { type: @tile.type, x: @tile.x, y: @tile.y }
    assert_redirected_to tile_path(assigns(:tile))
  end

  test "should destroy tile" do
    assert_difference('Tile.count', -1) do
      delete :destroy, id: @tile
    end

    assert_redirected_to tiles_path
  end
end
