json.extract! event, :id, :calendar_id, :name, :description, :duration, :created_at, :updated_at
json.url event_url(event, format: :json)
