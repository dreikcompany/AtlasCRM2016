json.array!(@benefits) do |benefit|
  json.extract! benefit, :id, :descripcion, :estatus
  json.url benefit_url(benefit, format: :json)
end
