require "application_system_test_case"

class MyfilesTest < ApplicationSystemTestCase
  setup do
    @myfile = myfiles(:one)
  end

  test "visiting the index" do
    visit myfiles_url
    assert_selector "h1", text: "Myfiles"
  end

  test "should create myfile" do
    visit myfiles_url
    click_on "New myfile"

    fill_in "Filename", with: @myfile.filename
    fill_in "Title", with: @myfile.title
    click_on "Create Myfile"

    assert_text "Myfile was successfully created"
    click_on "Back"
  end

  test "should update Myfile" do
    visit myfile_url(@myfile)
    click_on "Edit this myfile", match: :first

    fill_in "Filename", with: @myfile.filename
    fill_in "Title", with: @myfile.title
    click_on "Update Myfile"

    assert_text "Myfile was successfully updated"
    click_on "Back"
  end

  test "should destroy Myfile" do
    visit myfile_url(@myfile)
    click_on "Destroy this myfile", match: :first

    assert_text "Myfile was successfully destroyed"
  end
end
