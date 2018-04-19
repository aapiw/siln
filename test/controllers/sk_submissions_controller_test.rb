require 'test_helper'

class SkSubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sk_submission = sk_submissions(:one)
  end

  test "should get index" do
    get sk_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_sk_submission_url
    assert_response :success
  end

  test "should create sk_submission" do
    assert_difference('SkSubmission.count') do
      post sk_submissions_url, params: { sk_submission: { school_id: @sk_submission.school_id, year: @sk_submission.year } }
    end

    assert_redirected_to sk_submission_url(SkSubmission.last)
  end

  test "should show sk_submission" do
    get sk_submission_url(@sk_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_sk_submission_url(@sk_submission)
    assert_response :success
  end

  test "should update sk_submission" do
    patch sk_submission_url(@sk_submission), params: { sk_submission: { school_id: @sk_submission.school_id, year: @sk_submission.year } }
    assert_redirected_to sk_submission_url(@sk_submission)
  end

  test "should destroy sk_submission" do
    assert_difference('SkSubmission.count', -1) do
      delete sk_submission_url(@sk_submission)
    end

    assert_redirected_to sk_submissions_url
  end
end
