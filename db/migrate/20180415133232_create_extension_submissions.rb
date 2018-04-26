class CreateExtensionSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :extension_submissions do |t|
      t.references :school, foreign_key: true
      t.string :year
      t.attachment :perpanjangan_tugas
      t.text :recent_extention
      # t.boolean :approved_by_admin, default:false
      

      t.timestamps
    end
  end
end
