Role.create!([
  {name: "admin", title: "role for admin", description: "this user can do anything", the_role: "{\"system\":{\"administrator\":true}}"},
  {name: "deposito", title: "Recepcion de Materiales", description: "Rol para el personal que recibe materiales", the_role: "{\"certificados\":{\"index\":true,\"new\":true,\"create\":true,\"show\":true,\"edit\":true,\"delete\":true},\"proveedors\":{\"index\":true,\"show\":true,\"edit\":false,\"delete\":false},\"productos\":{\"index\":true,\"show\":true},\"sucursals\":{\"index\":true,\"show\":true},\"home\":{\"index\":true}}"},
  {name: "ventas", title: "Ventas", description: "Ventas", the_role: "{\"certificados\":{\"show\":true,\"index\":true},\"productos\":{\"show\":true,\"index\":true},\"sucursals\":{\"index\":true,\"show\":true},\"home\":{\"index\":true},\"proveedors\":{\"index\":true,\"show\":true}}"}
])
Organizacion.create!([
  {nombre: "Hierrobeco, C.A.", rif: "J-007468856"}
])
Sucursal.create!([
  {nombre: "Caracas", organizacion_id: 1, direccion: "Palo Verde"},
  {nombre: "San Joaquin", organizacion_id: 1, direccion: "San Joaquin"},
  {nombre: "Barquisimeto", organizacion_id: 1, direccion: "Barquisimeto"},
  {nombre: "Puerto Ordaz", organizacion_id: 1, direccion: "Puerto Ordaz"}
])
User.create!([
  {name: "jose", password: "jose", password_confirmation: "jose", remember_created_at: nil, role_id: 1, sucursal_id: 2},
  {name: "elisa", password: "elisa", password_confirmation: "elisa", remember_created_at: nil, role_id: 2, sucursal_id: 1},
  {name: "fredys", password: "fredys", password_confirmation: "fredys", remember_created_at: nil, role_id: 3, sucursal_id: 3}
])
Proveedor.create!([
  {name: "SIDOR", rif: "J-234234", nacional: true},
  {name: "Ferrominera del Orinoco", rif: "J-974327", nacional: true},
  {name: "Materiales ABC", rif: "G-435234", nacional: true},
  {name: "Metales Chuo", rif: "J-876123", nacional: false}
])
Certificado.create!([
  {numero_certificado: "678678546", numero_guia_proveedor: "5467864", numero_codigo_producto: "546453123", numero_orden_compra: "45645678456", proveedor_id: 2, adjunto_file_name: "Linuxdoc-Ejemplo.pdf", adjunto_content_type: "application/pdf", adjunto_file_size: 21124, adjunto_updated_at: "2014-11-01 20:32:24", fecha_recepcion: "2014-11-06", sucursal_id: 2},
  {numero_certificado: "546234435", numero_guia_proveedor: "53245345", numero_codigo_producto: "34556234534", numero_orden_compra: "3453453453", proveedor_id: 3, adjunto_file_name: "Linuxdoc-Ejemplo.pdf", adjunto_content_type: "application/pdf", adjunto_file_size: 21124, adjunto_updated_at: "2014-11-01 20:41:08", fecha_recepcion: "2014-11-20", sucursal_id: 1},
  {numero_certificado: "789546456", numero_guia_proveedor: "567546767", numero_codigo_producto: "6783543543", numero_orden_compra: "56575464", proveedor_id: 2, adjunto_file_name: "cencoex_provincial.pdf", adjunto_content_type: "application/pdf", adjunto_file_size: 184086, adjunto_updated_at: "2014-11-01 20:48:30", fecha_recepcion: "2014-10-21", sucursal_id: 2},
  {numero_certificado: "45684103246", numero_guia_proveedor: "54864513", numero_codigo_producto: "8765487564", numero_orden_compra: "8974231864", proveedor_id: 4, adjunto_file_name: "Linuxdoc-Ejemplo.pdf", adjunto_content_type: "application/pdf", adjunto_file_size: 21124, adjunto_updated_at: "2014-11-01 21:02:49", fecha_recepcion: "2014-11-14", sucursal_id: 2},
  {numero_certificado: "2014010100005", numero_guia_proveedor: "00005", numero_codigo_producto: "00005", numero_orden_compra: "00005", proveedor_id: 2, adjunto_file_name: "cedula_17704098.pdf", adjunto_content_type: "application/pdf", adjunto_file_size: 543809, adjunto_updated_at: "2014-11-02 13:52:39", fecha_recepcion: "2014-10-14", sucursal_id: 2},
  {numero_certificado: "8987687698698", numero_guia_proveedor: "8796988967", numero_codigo_producto: "7698687687", numero_orden_compra: "868769", proveedor_id: 2, adjunto_file_name: "cedula_17704098.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 426437, adjunto_updated_at: "2014-11-02 13:57:52", fecha_recepcion: "2014-11-19", sucursal_id: 2},
  {numero_certificado: "000001", numero_guia_proveedor: "000001", numero_codigo_producto: "000001", numero_orden_compra: "000001", proveedor_id: 3, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-11-02 14:05:31", fecha_recepcion: "2014-10-31", sucursal_id: 1},
  {numero_certificado: "5555", numero_guia_proveedor: "5555", numero_codigo_producto: "5555", numero_orden_compra: "55555", proveedor_id: 1, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-11-02 14:38:50", fecha_recepcion: "2013-08-14", sucursal_id: 1},
  {numero_certificado: "000002", numero_guia_proveedor: "000002", numero_codigo_producto: "000002", numero_orden_compra: "000002", proveedor_id: 4, adjunto_file_name: "real_madrid_logo.jpeg", adjunto_content_type: "image/jpeg", adjunto_file_size: 30927, adjunto_updated_at: "2014-11-02 14:45:04", fecha_recepcion: "2014-10-03", sucursal_id: 1},
  {numero_certificado: "546234435", numero_guia_proveedor: "000003", numero_codigo_producto: "000003", numero_orden_compra: "000003", proveedor_id: 4, adjunto_file_name: "real_madrid_logo.jpeg", adjunto_content_type: "image/jpeg", adjunto_file_size: 30927, adjunto_updated_at: "2014-11-02 15:02:23", fecha_recepcion: "2014-10-31", sucursal_id: 1}
])
Colada.create!([
  {numero: "7435345", certificado_id: 4},
  {numero: "3454363423", certificado_id: 4},
  {numero: "87645415", certificado_id: 5},
  {numero: "9464845", certificado_id: 5},
  {numero: "100000", certificado_id: 6},
  {numero: "100001", certificado_id: 6},
  {numero: "100002", certificado_id: 6},
  {numero: "000001", certificado_id: 8},
  {numero: "5555", certificado_id: 9},
  {numero: "5555", certificado_id: 9},
  {numero: "000001", certificado_id: 10},
  {numero: "000003", certificado_id: 10},
  {numero: "000004", certificado_id: 10},
  {numero: "000003", certificado_id: 10}
])
Producto.create!([
  {codigo: "xd-6734534", descripcion: "Cabillas"},
  {codigo: "c4-56324-7", descripcion: "Laminas de metal"}
])



