require 'test_helper'

class ExtensionSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extension_submission = extension_submissions(:one)
  end

  test "should get index" do
    get extension_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_extension_submission_url
    assert_response :success
  end

  test "should create extension_submission" do
    assert_difference('ExtensionSubmission.count') do
      post extension_submissions_url, params: { extension_submission: { approved_by_admin: @extension_submission.approved_by_admin, school_id: @extension_submission.school_id, year: @extension_submission.year } }
    end

    assert_redirected_to extension_submission_url(ExtensionSubmission.last)
  end

  test "should show extension_submission" do
    get extension_submission_url(@extension_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_extension_submission_url(@extension_submission)
    assert_response :success
  end

  test "should update extension_submission" do
    patch extension_submission_url(@extension_submission), params: { extension_submission: { approved_by_admin: @extension_submission.approved_by_admin, school_id: @extension_submission.school_id, year: @extension_submission.year } }
    assert_redirected_to extension_submission_url(@extension_submission)
  end

  test "should destroy extension_submission" do
    assert_difference('ExtensionSubmission.count', -1) do
      delete extension_submission_url(@extension_submission)
    end

    assert_redirected_to extension_submissions_url
  end
end
