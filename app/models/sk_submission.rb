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

class SkSubmission < ApplicationRecord
  
  attr_accessor :admin#, :sk_ids

  # has_many :teachers
  has_many :sks, dependent: :nullify
  
  belongs_to :school
  
  # after_save :save_sks

  # def save_sks

  # end

end
