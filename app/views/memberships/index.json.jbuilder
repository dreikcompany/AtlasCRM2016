json.array!(@memberships) do |membership|
  json.extract! membership, :id, :nombre, :monto, :estatus
  json.url membership_url(membership, format: :json)
end
