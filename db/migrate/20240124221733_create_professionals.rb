class CreateProfessionals < ActiveRecord::Migration[7.1]
  def change
    create_table :professionals do |t|
      t.string :first_name
      t.string :last_name
      t.string :specialty

      t.timestamps
    end
  end
end
