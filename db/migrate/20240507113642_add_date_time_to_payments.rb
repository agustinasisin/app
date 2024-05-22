class AddDateTimeToPayments < ActiveRecord::Migration[7.1]
  def change
    add_column :payments, :datetime, :datetime
  end
end
