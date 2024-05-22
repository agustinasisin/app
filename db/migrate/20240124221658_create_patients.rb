class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :document
      t.string :phone_number
      t.string :email
      t.date :birth_date

      t.timestamps
    end
  end
end
