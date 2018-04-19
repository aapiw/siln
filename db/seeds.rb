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
		# debugger
		school.save
end
puts 'end create Sekolah seed'