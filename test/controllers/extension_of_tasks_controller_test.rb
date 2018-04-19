require 'test_helper'

class ExtensionOfTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extension_of_task = extension_of_tasks(:one)
  end

  test "should get index" do
    get extension_of_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_extension_of_task_url
    assert_response :success
  end

  test "should create extension_of_task" do
    assert_difference('ExtensionOfTask.count') do
      post extension_of_tasks_url, params: { extension_of_task: { approved_by_school: @extension_of_task.approved_by_school, assessment: @extension_of_task.assessment, note: @extension_of_task.note, persetujuan_pemda_or_sekolah: @extension_of_task.persetujuan_pemda_or_sekolah, rekomendasi_perwakilan: @extension_of_task.rekomendasi_perwakilan, sk_mendikbud: @extension_of_task.sk_mendikbud, surat_persetujuan_setneg: @extension_of_task.surat_persetujuan_setneg, teacher_id: @extension_of_task.teacher_id, year: @extension_of_task.year } }
    end

    assert_redirected_to extension_of_task_url(ExtensionOfTask.last)
  end

  test "should show extension_of_task" do
    get extension_of_task_url(@extension_of_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_extension_of_task_url(@extension_of_task)
    assert_response :success
  end

  test "should update extension_of_task" do
    patch extension_of_task_url(@extension_of_task), params: { extension_of_task: { approved_by_school: @extension_of_task.approved_by_school, assessment: @extension_of_task.assessment, note: @extension_of_task.note, persetujuan_pemda_or_sekolah: @extension_of_task.persetujuan_pemda_or_sekolah, rekomendasi_perwakilan: @extension_of_task.rekomendasi_perwakilan, sk_mendikbud: @extension_of_task.sk_mendikbud, surat_persetujuan_setneg: @extension_of_task.surat_persetujuan_setneg, teacher_id: @extension_of_task.teacher_id, year: @extension_of_task.year } }
    assert_redirected_to extension_of_task_url(@extension_of_task)
  end

  test "should destroy extension_of_task" do
    assert_difference('ExtensionOfTask.count', -1) do
      delete extension_of_task_url(@extension_of_task)
    end

    assert_redirected_to extension_of_tasks_url
  end
end
