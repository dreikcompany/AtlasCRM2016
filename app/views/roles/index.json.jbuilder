json.array!(@roles) do |role|
  json.extract! role, :id, :nombre, :estatus
  json.url role_url(role, format: :json)
end
