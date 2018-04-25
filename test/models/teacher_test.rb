# == Schema Information
#
# Table name: teachers
#
#  id                  :integer          not null, primary key
#  school_id           :integer
#  name                :string
#  pns                 :boolean
#  age                 :string
#  period_of_teaching  :string
#  number_of_extension :integer
#  expire              :date
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
