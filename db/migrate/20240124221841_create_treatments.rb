class CreateTreatments < ActiveRecord::Migration[7.1]
  def change
    create_table :treatments do |t|
      t.string :name
      t.decimal :cost
      t.integer :duration

      t.timestamps
    end
  end
end
