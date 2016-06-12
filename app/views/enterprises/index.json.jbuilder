json.array!(@enterprises) do |enterprise|
  json.extract! enterprise, :id, :nom_enterprise, :nom_intranet, :rif, :vision, :mision, :direccion, :telefono, :slogan, :user_id
  json.url enterprise_url(enterprise, format: :json)
end
