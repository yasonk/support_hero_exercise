json.array!(@schedule) do |support_duty|
  json.extract! support_duty, :id, :date, :user
  json.url user_url(support_duty.user, format: :json)
end
