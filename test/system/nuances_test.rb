require "application_system_test_case"

class NuancesTest < ApplicationSystemTestCase
  setup do
    @nuance = nuances(:one)
  end

  test "visiting the index" do
    visit nuances_url
    assert_selector "h1", text: "Nuances"
  end

  test "should create nuance" do
    visit nuances_url
    click_on "New nuance"

    fill_in "Image", with: @nuance.image
    fill_in "Name", with: @nuance.name
    click_on "Create Nuance"

    assert_text "Nuance was successfully created"
    click_on "Back"
  end

  test "should update Nuance" do
    visit nuance_url(@nuance)
    click_on "Edit this nuance", match: :first

    fill_in "Image", with: @nuance.image
    fill_in "Name", with: @nuance.name
    click_on "Update Nuance"

    assert_text "Nuance was successfully updated"
    click_on "Back"
  end

  test "should destroy Nuance" do
    visit nuance_url(@nuance)
    click_on "Destroy this nuance", match: :first

    assert_text "Nuance was successfully destroyed"
  end
end
