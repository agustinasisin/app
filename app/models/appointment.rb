class Appointment < ApplicationRecord
    belongs_to :patient
    belongs_to :professional
    belongs_to :clinic
    belongs_to :treatment
    belongs_to :payment

    validate :fecha_actual_o_posterior
    validate :horario_clinica
    validate :horario_finde_prohibido

    #PAYMENT_METHODS = ["deb", "cred", "transf", "efe"]
    #validates :payment_method, inclusion: { in: PAYMENT_METHODS, message: "%{value} no es un método de pago válido" }, allow_blank: false
    private

    def fecha_actual_o_posterior
        if date.present? && date < Date.today
        errors.add(:date, "no puede ser en el pasado")
        end
    end

    def horario_clinica
        if hour.present? && !(9..18).cover?(hour.hour)
          errors.add(:hour, "debe estar entre las 09:00 y las 18:00")
        end
    end

    def horario_finde_prohibido
        if date.present? && [0, 6].include?(date.wday)
          errors.add(:date, "no puede ser un fin de semana")
        end
    end
end
