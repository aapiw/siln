# == Schema Information
#
# Table name: sks
#
#  id                                 :bigint(8)        not null, primary key
#  teacher_id                         :bigint(8)
#  year                               :string
#  permohonan_perwakilan_file_name    :string
#  permohonan_perwakilan_content_type :string
#  permohonan_perwakilan_file_size    :integer
#  permohonan_perwakilan_updated_at   :datetime
#  ijazah_file_name                   :string
#  ijazah_content_type                :string
#  ijazah_file_size                   :integer
#  ijazah_updated_at                  :datetime
#  sertifikat_pendidik_file_name      :string
#  sertifikat_pendidik_content_type   :string
#  sertifikat_pendidik_file_size      :integer
#  sertifikat_pendidik_updated_at     :datetime
#  nuptk_file_name                    :string
#  nuptk_content_type                 :string
#  nuptk_file_size                    :integer
#  nuptk_updated_at                   :datetime
#  sk_perwakilan_file_name            :string
#  sk_perwakilan_content_type         :string
#  sk_perwakilan_file_size            :integer
#  sk_perwakilan_updated_at           :datetime
#  ktp_or_paspor_file_name            :string
#  ktp_or_paspor_content_type         :string
#  ktp_or_paspor_file_size            :integer
#  ktp_or_paspor_updated_at           :datetime
#  kk_file_name                       :string
#  kk_content_type                    :string
#  kk_file_size                       :integer
#  kk_updated_at                      :datetime
#  cv_file_name                       :string
#  cv_content_type                    :string
#  cv_file_size                       :integer
#  cv_updated_at                      :datetime
#  sk_inpassing_file_name             :string
#  sk_inpassing_content_type          :string
#  sk_inpassing_file_size             :integer
#  sk_inpassing_updated_at            :datetime
#  biodata_ln_file_name               :string
#  biodata_ln_content_type            :string
#  biodata_ln_file_size               :integer
#  biodata_ln_updated_at              :datetime
#  form_biaya_file_name               :string
#  form_biaya_content_type            :string
#  form_biaya_file_size               :integer
#  form_biaya_updated_at              :datetime
#  pernyataan_file_name               :string
#  pernyataan_content_type            :string
#  pernyataan_file_size               :integer
#  pernyataan_updated_at              :datetime
#  note                               :string
#  sk_untuk_guru_file_name            :string
#  sk_untuk_guru_content_type         :string
#  sk_untuk_guru_file_size            :integer
#  sk_untuk_guru_updated_at           :datetime
#  approved_by_admin                  :boolean          default(FALSE)
#  created_at                         :datetime         not null
#  updated_at                         :datetime         not null
#

require 'test_helper'

class SkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
