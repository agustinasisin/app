class Professional < ApplicationRecord
    has_many :appointments

    SPECIALTIES = ["Cardiología", "Dermatología", "Ginecología", "Neurología", "Oftalmología", "Pediatría", "Psiquiatría"]
    validates :first_name, :last_name, presence: true
    validates :specialty, inclusion: { in: SPECIALTIES, message: "%{value} no es una especialidad válida" }, allow_blank: false

    def full_name
        "#{first_name} #{last_name}"
    end
end
