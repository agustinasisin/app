json.extract! patient, :id, :first_name, :last_name, :document, :phone_number, :email, :birth_date, :created_at, :updated_at
json.url patient_url(patient, format: :json)
