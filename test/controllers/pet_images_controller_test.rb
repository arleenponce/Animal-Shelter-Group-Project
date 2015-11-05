require 'test_helper'

class PetImagesControllerTest < ActionController::TestCase
  setup do
    @pet_image = pet_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_image" do
    assert_difference('PetImage.count') do
      post :create, pet_image: { pet_id: @pet_image.pet_id }
    end

    assert_redirected_to pet_image_path(assigns(:pet_image))
  end

  test "should show pet_image" do
    get :show, id: @pet_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_image
    assert_response :success
  end

  test "should update pet_image" do
    patch :update, id: @pet_image, pet_image: { pet_id: @pet_image.pet_id }
    assert_redirected_to pet_image_path(assigns(:pet_image))
  end

  test "should destroy pet_image" do
    assert_difference('PetImage.count', -1) do
      delete :destroy, id: @pet_image
    end

    assert_redirected_to pet_images_path
  end
end
