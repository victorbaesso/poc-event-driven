json.extract! budget, :id, :value, :deadline, :status, :created_at, :updated_at
json.url budget_url(budget, format: :json)
