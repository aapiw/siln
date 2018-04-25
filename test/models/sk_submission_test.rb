# == Schema Information
#
# Table name: sk_submissions
#
#  id                :integer          not null, primary key
#  year              :string
#  school_id         :integer
#  approved_by_admin :boolean          default(FALSE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class SkSubmissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
