# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

30.times do
    Patient.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        document: Faker::IDNumber.valid,
        phone_number: Faker::PhoneNumber.phone_number_with_country_code,
        birth_date: Faker::Date.between(from: 100.years.ago, to: Date.today)
    )
end

15.times do
    Professional.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name
    )
end

