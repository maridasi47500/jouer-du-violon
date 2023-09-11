require "application_system_test_case"

class MemosTest < ApplicationSystemTestCase
  setup do
    @memo = memos(:one)
  end

  test "visiting the index" do
    visit memos_url
    assert_selector "h1", text: "Memos"
  end

  test "should create memo" do
    visit memos_url
    click_on "New memo"

    fill_in "Post", with: @memo.post_id
    fill_in "User", with: @memo.user_id
    click_on "Create Memo"

    assert_text "Memo was successfully created"
    click_on "Back"
  end

  test "should update Memo" do
    visit memo_url(@memo)
    click_on "Edit this memo", match: :first

    fill_in "Post", with: @memo.post_id
    fill_in "User", with: @memo.user_id
    click_on "Update Memo"

    assert_text "Memo was successfully updated"
    click_on "Back"
  end

  test "should destroy Memo" do
    visit memo_url(@memo)
    click_on "Destroy this memo", match: :first

    assert_text "Memo was successfully destroyed"
  end
end
