json.array!(@devices) do |device|
  json.extract! device, :id, :device_token, :device_type, :user_id
  json.url device_url(device, format: :json)
end
