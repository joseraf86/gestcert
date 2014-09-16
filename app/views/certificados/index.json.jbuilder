json.array!(@certificados) do |certificado|
  json.extract! certificado, :id, :numero_certificado, :numero_guia_proveedor, :numero_codigo_producto, :numero_colada, :numero_orden_compra
  json.url certificado_url(certificado, format: :json)
end
