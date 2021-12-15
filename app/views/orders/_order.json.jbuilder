json.extract! order, :id, :order_number, :delivery_date, :created_at, :updated_at
json.url order_url(order, format: :json)
