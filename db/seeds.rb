Role.create!([
  {name: "admin", title: "role for admin", description: "this user can do anything", the_role: "{\"system\":{\"administrator\":true}}"},
  {name: "recepcion", title: "Recepcion de Materiales", description: "Rol para el personal que recibe materiales", the_role: "{\"certificados\":{\"index\":true,\"new\":true,\"create\":true,\"show\":true,\"edit\":false,\"delete\":false},\"proveedors\":{\"index\":true,\"show\":true,\"edit\":false,\"delete\":false}}"}
])
User.create!([
  {name: "elisa", encrypted_password: "$2a$10$B58wrEv3OnqvhSDIElB4MuNL8YWpZlW9vfqcXbNq/FRpAAh2quNnS", remember_created_at: nil, role_id: 2, sucursal_id: 1},
  {name: "jose", encrypted_password: "$2a$10$3tUrfeWqD8DALeikDeVJIO5JqA3j1IzMrQbvU6A7fpplnN/ENXB/.", remember_created_at: nil, role_id: 1, sucursal_id: 2}
])
Organizacion.create!([
  {nombre: "Hierrobeco, C.A.", rif: "J-007468856"}
])
Sucursal.create!([
  {nombre: "Caracas", organizacion_id: 1, direccion: "Palo Verde"},
  {nombre: "San Joaquin", organizacion_id: 1, direccion: "San Joaquin"}
])
Proveedor.create!([
  {name: "SIDOR", rif: "J-234234", nacional: true},
  {name: "Ferrominera del Orinoco", rif: "J-974327", nacional: true},
  {name: "Materiales ABC", rif: "G-435234", nacional: true},
  {name: "Metales Chuo", rif: "J-876123", nacional: false}
])
Certificado.create!([
   {numero_certificado: "0983453456", numero_guia_proveedor: "2345324", numero_codigo_producto: "35476234", numero_colada: "564234", numero_orden_compra: "657876345", proveedor_id: 1, adjunto_file_name: "Linuxdoc-Ejemplo.pdf", adjunto_content_type: "application/pdf", adjunto_file_size: 21124, adjunto_updated_at: "2014-10-26 06:32:46", fecha_recepcion: "2014-10-03", sucursal_id: 1}
])