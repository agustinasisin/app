class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.string :payment_method

      t.timestamps
    end
  end
end
