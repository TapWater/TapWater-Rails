json.array!(@admins) do |admin|
  json.extract! admin, :id, :email, :name, :password_digest
  json.url admin_url(admin, format: :json)
end
