class Payment < ApplicationRecord
    has_many :appointments
    PAYMENT_METHODS = ["Tarjeta de débito", "Tarjeta de crédito", "Transferencia", "Efectivo"]
    validates :payment_method, inclusion: { in: PAYMENT_METHODS, message: "%{value} no es un método de pago válido" }, allow_blank: false

    validates :amount, :payment_method, presence: true

    before_create :actual_datetime

    delegate :patient, to: :appointments, allow_nil: true

    private

    def actual_datetime
        self.datetime = Time.zone.now
    end
end
