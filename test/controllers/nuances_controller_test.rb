require "test_helper"

class NuancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nuance = nuances(:one)
  end

  test "should get index" do
    get nuances_url
    assert_response :success
  end

  test "should get new" do
    get new_nuance_url
    assert_response :success
  end

  test "should create nuance" do
    assert_difference("Nuance.count") do
      post nuances_url, params: { nuance: { image: @nuance.image, name: @nuance.name } }
    end

    assert_redirected_to nuance_url(Nuance.last)
  end

  test "should show nuance" do
    get nuance_url(@nuance)
    assert_response :success
  end

  test "should get edit" do
    get edit_nuance_url(@nuance)
    assert_response :success
  end

  test "should update nuance" do
    patch nuance_url(@nuance), params: { nuance: { image: @nuance.image, name: @nuance.name } }
    assert_redirected_to nuance_url(@nuance)
  end

  test "should destroy nuance" do
    assert_difference("Nuance.count", -1) do
      delete nuance_url(@nuance)
    end

    assert_redirected_to nuances_url
  end
end
