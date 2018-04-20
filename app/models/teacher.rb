class Teacher < ApplicationRecord
	has_one :sk
	has_many :extension_of_task

  belongs_to :school, optional:true
  belongs_to :sk_submission, optional:true

	validates_presence_of :name, :age, :number_of_extension, :period_of_teaching, :expire

	def print_pns
		self.pns ? "Ya" : "Bukan"
	end

end
