require "application_system_test_case"

class TasklistsTest < ApplicationSystemTestCase
  setup do
    @tasklist = tasklists(:one)
  end

  test "visiting the index" do
    visit tasklists_url
    assert_selector "h1", text: "Tasklists"
  end

  test "creating a Tasklist" do
    visit tasklists_url
    click_on "New Tasklist"

    fill_in "Title", with: @tasklist.title
    click_on "Create Tasklist"

    assert_text "Tasklist was successfully created"
    click_on "Back"
  end

  test "updating a Tasklist" do
    visit tasklists_url
    click_on "Edit", match: :first

    fill_in "Title", with: @tasklist.title
    click_on "Update Tasklist"

    assert_text "Tasklist was successfully updated"
    click_on "Back"
  end

  test "destroying a Tasklist" do
    visit tasklists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tasklist was successfully destroyed"
  end
end
