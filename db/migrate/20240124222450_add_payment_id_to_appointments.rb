class AddPaymentIdToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :payment, null: true, foreign_key: true
  end
end
