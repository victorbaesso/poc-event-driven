json.extract! budget_product, :id, :value, :quantity, :product_id, :budget_id, :created_at, :updated_at
json.url budget_product_url(budget_product, format: :json)
