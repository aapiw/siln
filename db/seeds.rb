# NEGARA
puts 'start create countries seed'
negaraxls = Roo::Excelx.new( Rails.root.join('NEGARA.xlsx') )

negaraxls.each_row_streaming(offset: 1) do |row|
  country = Country.find_or_create_by( name: row[1].value, country_code: row[2].value.class == Float ? row[2].value.to_i : row[2].value, iso_code: row[3].value )
  puts country
  puts Country.count
end
puts 'end create countries seed'

puts 'start create Sekolah seed'
schoolxls = Roo::Excelx.new( Rails.root.join("DAFTAR SEKOLAH.xlsx") )
schoolxls.each_row_streaming(offset: 1) do |row|
		school = School.new
		school.name = row[1].value
		school.country_id = Country.find_by_name(row[2].value.titleize).id
		school.username = row[3].value
		school.password =  row[4].value
		school.password_confirmation =  row[4].value
		school.display_password =  row[4].value
		school.save
end
puts 'end create Sekolah seed'

# School 1 create Sk submission
SkSubmission.create(year:"2018", recent_sk:[1,2,4], school_id:1)
SkSubmission.create(year:"2019", recent_sk:[1], school_id:1)
SkSubmission.create(year:"2020", recent_sk:[4], school_id:1)


#  => #<ExtensionSubmission id: nil, school_id: nil, year: nil, perpanjangan_tugas_file_name: nil, perpanjangan_tugas_content_type: nil, perpanjangan_tugas_file_size: nil, perpanjangan_tugas_updated_at: nil, approved_by_school: false, created_at: nil, updated_at: nil> 
ExtensionSubmission.new(school_id:1, recent_extention:[1,2,3], year:"2018").save(validate: false)
ExtensionSubmission.new(school_id:1, recent_extention:[4], year:"2019").save(validate: false)
ExtensionSubmission.new(school_id:1, recent_extention:[3], year:"2020").save(validate: false)

# School 1 create teachers
Teacher.create(school_id:1, name:"Doni", age:"40", period_of_teaching:"15", expire:Time.now.next_month)
Teacher.create(school_id:1, name:"Donita", age:"40", period_of_teaching:"15", expire:Time.now.next_month)
Teacher.create(school_id:1, name:"Dede", age:"40", period_of_teaching:"15", expire:Time.now.next_month)
Teacher.create(school_id:1, name:"Budi", age:"40", period_of_teaching:"15", expire:Time.now.next_month)
Teacher.create(school_id:1, name:"Rendi", pns:true, age:"40", period_of_teaching:"15", expire:Time.now.next_month)

# Teachers of school create sk submission
Teacher.find(1).sks.new(year: "2018").save(validate:false)
Teacher.find(1).sks.new(year: "2019").save(validate:false)

Teacher.find(2).sks.new(year: "2018").save(validate:false)

Teacher.find(4).sks.new(year: "2018").save(validate:false)
Teacher.find(4).sks.new(year: "2020").save(validate:false)

Teacher.find(1).extension_of_tasks.new(year: "2018").save(validate:false)

Teacher.find(2).extension_of_tasks.new(year: "2018").save(validate:false)
Teacher.find(3).extension_of_tasks.new(year: "2018").save(validate:false)
Teacher.find(3).extension_of_tasks.new(year: "2020").save(validate:false)
Teacher.find(4).extension_of_tasks.new(year: "2019").save(validate:false)

School.create(username:"admin", name:"admin", password:"admin!", country_id:1, admin:true)

