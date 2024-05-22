json.extract! appointment, :id, :date, :hour, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
