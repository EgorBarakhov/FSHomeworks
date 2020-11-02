require 'test_helper'

class TasklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tasklist = tasklists(:one)
  end

  test "should get index" do
    get tasklists_url
    assert_response :success
  end

  test "should get new" do
    get new_tasklist_url
    assert_response :success
  end

  test "should create tasklist" do
    assert_difference('Tasklist.count') do
      post tasklists_url, params: { tasklist: { title: @tasklist.title } }
    end

    assert_redirected_to tasklist_url(Tasklist.last)
  end

  test "should show tasklist" do
    get tasklist_url(@tasklist)
    assert_response :success
  end

  test "should get edit" do
    get edit_tasklist_url(@tasklist)
    assert_response :success
  end

  test "should update tasklist" do
    patch tasklist_url(@tasklist), params: { tasklist: { title: @tasklist.title } }
    assert_redirected_to tasklist_url(@tasklist)
  end

  test "should destroy tasklist" do
    assert_difference('Tasklist.count', -1) do
      delete tasklist_url(@tasklist)
    end

    assert_redirected_to tasklists_url
  end
end
