# == Schema Information
#
# Table name: extension_submissions
#
#  id                              :integer          not null, primary key
#  school_id                       :integer
#  year                            :string
#  perpanjangan_tugas_file_name    :string
#  perpanjangan_tugas_content_type :string
#  perpanjangan_tugas_file_size    :integer
#  perpanjangan_tugas_updated_at   :datetime
#  approved_by_school              :boolean          default(FALSE)
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

require 'test_helper'

class ExtensionSubmissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
