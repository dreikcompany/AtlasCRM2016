json.array!(@permissions) do |permission|
  json.extract! permission, :id, :url, :texto,:padre, :estatus
  json.url permission_url(permission, format: :json)
end
