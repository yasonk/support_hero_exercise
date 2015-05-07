json.array!(@support_assignments) do |support_assignment|
  json.extract! support_assignment, :id, :date, :user_id
  json.url support_assignment_url(support_assignment, format: :json)
end
