# == Schema Information
#
# Table name: schools
#
#  id                  :integer          not null, primary key
#  username            :string           default(""), not null
#  email               :string
#  encrypted_password  :string           default(""), not null
#  display_password    :string
#  name                :string
#  remember_created_at :datetime
#  country_id          :integer
#  responsible_school  :string
#  phone               :string
#  admin               :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
