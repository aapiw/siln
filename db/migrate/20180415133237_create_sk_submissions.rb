class CreateSkSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :sk_submissions do |t|
      t.string :year
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
