json.array!(@drinks) do |drink|
  json.extract! drink, :id, :category, :user_id, :uuid, :drink_date
  json.url drink_url(drink, format: :json)
end
