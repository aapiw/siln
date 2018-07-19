# == Schema Information
#
# Table name: sk_submissions
#
#  id         :bigint(8)        not null, primary key
#  year       :string
#  school_id  :bigint(8)
#  recent_sk  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SkSubmission < ApplicationRecord
  # serialize :recent_sk, Hash
  
  attr_accessor :admin, :sk_ids#, :teacher_ids

  # has_many :teachers
  has_many :sks, dependent: :nullify

  belongs_to :school
  
  after_save :update_sks, if: :sk_ids
  # after_save :create_sks, if: :teacher_ids

  def update_sks
    sk_ids.reject!(&:blank?)
    if sk_ids.map{|e| e.to_i }.sort != self.sks.pluck(:id).sort
      Sk.where(id: self.sks.pluck(:id), year:self.year).update_all(sk_submission_id:nil)
      Sk.where(id: sk_ids, year:self.year).update_all(sk_submission_id:self.id)  
    end
  end

  # def create_sks
  #   teacher_ids.reject!(&:blank?)
  #   # if teacher_ids.map{|e| e.to_i }.sort != self.sks.pluck(:id).sort
  #   teachers = Teacher.where(id: teacher_ids)
  #   teachers.each do |t|
  #   if t.sks && t.sks.find_by_year(self.year)
  #     Sk.where(id: t.sks.find_by_year(self.year).id).update_all(sk_submission_id:nil)
  #     # Sk.where(id: sk_ids).update_all(sk_submission_id:self.id)  
  #   else#create sk
  #     debugger
  #     t.sks.new(sk_submission_id:self.id, year:self.year).save(validate:false)
  #   end

  # end
  # end
    
      
    
  class << self
  	def next_year
      return Time.now.year if count < 1
      all.map(&:year).sort.last.to_i+1
    end
  end


end