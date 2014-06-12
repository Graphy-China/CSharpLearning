json.array!(@entries) do |entry|
  json.extract! entry, :id, :name, :address, :phone, :email
  json.url entry_url(entry, format: :json)
end
