json.extract! room, :id, :person_name, :person_address, :person_id, :no_of_romms, :amount_per_room, :created_at, :updated_at
json.url room_url(room, format: :json)
