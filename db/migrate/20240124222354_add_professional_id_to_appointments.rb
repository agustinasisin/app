class AddProfessionalIdToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :professional, null: false, foreign_key: true
  end
end
