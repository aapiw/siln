json.extract! teacher, :id, :school_id, :sk_submission_id, :name, :pns, :age, :period_of_teaching, :number_of_extension, :expire, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
