json.array!(@drinks) do |drink|
  json.extract! drink, :category, :uuid, :drink_date
end
