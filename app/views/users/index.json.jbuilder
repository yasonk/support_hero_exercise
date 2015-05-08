json.array!(@users) do |user|
  json.extract! user, :id, :name, :unavailable_date
  json.url user_url(user, format: :json)
end
