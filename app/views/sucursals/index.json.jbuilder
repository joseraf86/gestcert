json.array!(@sucursals) do |sucursal|
  json.extract! sucursal, :id, :nombre, :organizacion_id, :direccion
  json.url sucursal_url(sucursal, format: :json)
end
