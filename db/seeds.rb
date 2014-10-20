Organizacion.create!([
                         {nombre: "Hierrobeco, C.A.", rif: "J-007468856"}
                     ])
Sucursal.create!([
                     {nombre: "Caracas", organizacion_id: 1, direccion: "Palo Verde"},
                     {nombre: "San Joaquin", organizacion_id: 1, direccion: "San Joaquin"}
                 ])
Role.create!([
                 {name: "admin", title: "role for admin", description: "this user can do anything", the_role: "{\"system\":{\"administrator\":true}}"},
                 {name: "recepcion", title: "Recepcion de Materiales", description: "Rol para el personal que recibe materiales", the_role: "{\"certificados\":{\"index\":true,\"new\":true,\"create\":true,\"show\":true,\"edit\":false,\"delete\":false},\"proveedors\":{\"index\":true,\"show\":true,\"edit\":false,\"delete\":false}}"}
             ])
User.create!([
  {name: "elisa", encrypted_password: "$2a$10$V5NXdaiLg2hNyPErx1xXV.YJM5XpwtGfs7whSXxtsk3VDkVpTKW92", remember_created_at: nil, role_id: 2, sucursal_id: 1},
  {name: "jose", encrypted_password: "$2a$10$DCT8KjAyRoGivZCEmT4ICOkxwmnvsg2eQjhs8O/pDlH5.J8UZAT1O", remember_created_at: nil, role_id: 1, sucursal_id: 2}
])
Proveedor.create!([
                      {name: "SIDOR", rif: "J-234234", nacional: true},
                      {name: "Ferrominera del Orinoco", rif: "J-974327", nacional: true},
                      {name: "Materiales ABC", rif: "G-435234", nacional: true},
                      {name: "Metales Chuo", rif: "J-876123", nacional: false}
                  ])
Certificado.create!([
  {numero_certificado: "201409220012", numero_guia_proveedor: "546345345", numero_codigo_producto: "43534534", numero_colada: "324345345", numero_orden_compra: "3453453", proveedor_id: 1, adjunto_file_name: "ratoncito-mani.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 16914, adjunto_updated_at: "2014-09-28 23:27:15", fecha_recepcion: "2014-09-22", sucursal_id: 1},
  {numero_certificado: "201409240002", numero_guia_proveedor: "6456", numero_codigo_producto: "345345435", numero_colada: "345345345", numero_orden_compra: "67435346", proveedor_id: 2, adjunto_file_name: "lovemouse.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 79713, adjunto_updated_at: "2014-10-03 04:15:41", fecha_recepcion: "2014-09-24", sucursal_id: 1},
  {numero_certificado: "201410120123", numero_guia_proveedor: "1122334455", numero_codigo_producto: "0001", numero_colada: "1234567890", numero_orden_compra: "987654321", proveedor_id: 1, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-10-12 13:42:06", fecha_recepcion: "2014-10-12", sucursal_id: 2},
  {numero_certificado: "201409200003", numero_guia_proveedor: "32463", numero_codigo_producto: "23645", numero_colada: "678678", numero_orden_compra: "2354564", proveedor_id: 4, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-10-12 16:06:51", fecha_recepcion: "2014-09-20", sucursal_id: 1},
  {numero_certificado: "201410120001", numero_guia_proveedor: "0010", numero_codigo_producto: "3001010", numero_colada: "34534867234", numero_orden_compra: "0010", proveedor_id: 1, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-10-12 16:28:40", fecha_recepcion: "2014-10-12", sucursal_id: 1},
  {numero_certificado: "201409150001", numero_guia_proveedor: "0001", numero_codigo_producto: "0001", numero_colada: "0001", numero_orden_compra: "0001", proveedor_id: 2, adjunto_file_name: "navegantes_del_magallanes.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 39014, adjunto_updated_at: "2014-10-12 16:29:48", fecha_recepcion: "2013-09-15", sucursal_id: 1},
  {numero_certificado: "201409150002", numero_guia_proveedor: "0002", numero_codigo_producto: "0002", numero_colada: "0002", numero_orden_compra: "0001", proveedor_id: 4, adjunto_file_name: "real_madrid_logo.jpeg", adjunto_content_type: "image/jpeg", adjunto_file_size: 30927, adjunto_updated_at: "2014-10-12 16:33:42", fecha_recepcion: "2014-09-15", sucursal_id: 1},
  {numero_certificado: "666", numero_guia_proveedor: "666", numero_codigo_producto: "666", numero_colada: "666", numero_orden_compra: "666", proveedor_id: 1, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-10-12 20:38:02", fecha_recepcion: "2014-10-12", sucursal_id: 1},
  {numero_certificado: "763454576", numero_guia_proveedor: "87934236456", numero_codigo_producto: "89343", numero_colada: "34987345345", numero_orden_compra: "564523445", proveedor_id: 2, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-10-18 17:20:24", fecha_recepcion: "2014-10-12", sucursal_id: 1},
  {numero_certificado: "88888", numero_guia_proveedor: "8888", numero_codigo_producto: "44444", numero_colada: "8888", numero_orden_compra: "99999", proveedor_id: 4, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-10-18 17:21:39", fecha_recepcion: "2014-10-15", sucursal_id: 1},
  {numero_certificado: "6666666666666666", numero_guia_proveedor: "6666666666666666666", numero_codigo_producto: "6666666666666666666666", numero_colada: "66666666666666666", numero_orden_compra: "6666666666666666666", proveedor_id: 1, adjunto_file_name: "certificado.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 133870, adjunto_updated_at: "2014-10-18 17:22:32", fecha_recepcion: "2014-10-11", sucursal_id: 1},
  {numero_certificado: "11111111", numero_guia_proveedor: "11111111", numero_codigo_producto: "11111111", numero_colada: "11111111", numero_orden_compra: "11111111", proveedor_id: 6, adjunto_file_name: "cedula_17704098.pdf", adjunto_content_type: "application/pdf", adjunto_file_size: 543809, adjunto_updated_at: "2014-10-19 21:07:14", fecha_recepcion: "1111-11-11", sucursal_id: 2},
  {numero_certificado: "2", numero_guia_proveedor: "2", numero_codigo_producto: "2", numero_colada: "2", numero_orden_compra: "2", proveedor_id: 1, adjunto_file_name: "cedula_17704098.pdf", adjunto_content_type: "application/pdf", adjunto_file_size: 543809, adjunto_updated_at: "2014-10-19 21:25:35", fecha_recepcion: "2011-11-11", sucursal_id: 2}
])
