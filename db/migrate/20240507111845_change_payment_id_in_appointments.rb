class ChangePaymentIdInAppointments < ActiveRecord::Migration[7.1]
  def change
    change_column_null :appointments, :payment_id, true
  end
end
