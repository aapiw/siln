# == Schema Information
#
# Table name: extension_of_tasks
#
#  id                                        :bigint(8)        not null, primary key
#  teacher_id                                :bigint(8)
#  extension_submission_id                   :bigint(8)
#  year                                      :string
#  rekomendasi_perwakilan_file_name          :string
#  rekomendasi_perwakilan_content_type       :string
#  rekomendasi_perwakilan_file_size          :integer
#  rekomendasi_perwakilan_updated_at         :datetime
#  persetujuan_pemda_or_sekolah_file_name    :string
#  persetujuan_pemda_or_sekolah_content_type :string
#  persetujuan_pemda_or_sekolah_file_size    :integer
#  persetujuan_pemda_or_sekolah_updated_at   :datetime
#  sk_mendikbud_file_name                    :string
#  sk_mendikbud_content_type                 :string
#  sk_mendikbud_file_size                    :integer
#  sk_mendikbud_updated_at                   :datetime
#  surat_persetujuan_setneg_file_name        :string
#  surat_persetujuan_setneg_content_type     :string
#  surat_persetujuan_setneg_file_size        :integer
#  surat_persetujuan_setneg_updated_at       :datetime
#  assessment                                :string
#  note                                      :string
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#

require 'test_helper'

class ExtensionOfTaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
