class Treatment < ApplicationRecord
    has_many :appointments

    validates :duration, presence: true
end
