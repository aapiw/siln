class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.references :school, foreign_key: true
      # t.references :sk_submission, foreign_key: true
      t.string :name
      t.boolean :pns, default:false
      t.string :age
      t.string :period_of_teaching
      # t.integer :number_of_extension
      t.date :expire

      t.timestamps
    end
  end
end
