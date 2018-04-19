require 'test_helper'

class SksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sk = sks(:one)
  end

  test "should get index" do
    get sks_url
    assert_response :success
  end

  test "should get new" do
    get new_sk_url
    assert_response :success
  end

  test "should create sk" do
    assert_difference('Sk.count') do
      post sks_url, params: { sk: { approved_by_admin: @sk.approved_by_admin, approved_by_school: @sk.approved_by_school, biodata_ln: @sk.biodata_ln, cv: @sk.cv, form_biaya: @sk.form_biaya, ijazah: @sk.ijazah, kk: @sk.kk, ktp_or_paspor: @sk.ktp_or_paspor, note: @sk.note, nuptk: @sk.nuptk, permohonan_perwakilan: @sk.permohonan_perwakilan, pernyataan: @sk.pernyataan, sertifikat_pendidik: @sk.sertifikat_pendidik, sk_for_teacher: @sk.sk_for_teacher, sk_inpassing: @sk.sk_inpassing, sk_perwakilan: @sk.sk_perwakilan, teacher_id: @sk.teacher_id, year: @sk.year } }
    end

    assert_redirected_to sk_url(Sk.last)
  end

  test "should show sk" do
    get sk_url(@sk)
    assert_response :success
  end

  test "should get edit" do
    get edit_sk_url(@sk)
    assert_response :success
  end

  test "should update sk" do
    patch sk_url(@sk), params: { sk: { approved_by_admin: @sk.approved_by_admin, approved_by_school: @sk.approved_by_school, biodata_ln: @sk.biodata_ln, cv: @sk.cv, form_biaya: @sk.form_biaya, ijazah: @sk.ijazah, kk: @sk.kk, ktp_or_paspor: @sk.ktp_or_paspor, note: @sk.note, nuptk: @sk.nuptk, permohonan_perwakilan: @sk.permohonan_perwakilan, pernyataan: @sk.pernyataan, sertifikat_pendidik: @sk.sertifikat_pendidik, sk_for_teacher: @sk.sk_for_teacher, sk_inpassing: @sk.sk_inpassing, sk_perwakilan: @sk.sk_perwakilan, teacher_id: @sk.teacher_id, year: @sk.year } }
    assert_redirected_to sk_url(@sk)
  end

  test "should destroy sk" do
    assert_difference('Sk.count', -1) do
      delete sk_url(@sk)
    end

    assert_redirected_to sks_url
  end
end
