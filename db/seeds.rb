Role.create!([
                 {name: "admin", title: "role for admin", description: "this user can do anything", the_role: "{\"system\":{\"administrator\":true}}"}
             ])
User.create!([
 # {name: "elisa", encrypted_password: "$2a$10$ja.qcymy0xktJAmZgbZRius7oH1wUPy.eITHgSr6inroR5sstMOPy", remember_created_at: nil, role_id: 1},
 # {name: "jose", encrypted_password: "$2a$10$0z/TmjIIdgB3mTfCVWpP0.aZSLXgVaWtWctlTC2xr2UxxR0gjcQKW", remember_created_at: nil, role_id: 1}
 {name: "elisa", password: 'elisa', password_confirmation: 'elisa', role_id: 1},
 {name: "jose",  password: 'jose',  password_confirmation: 'jose',  role_id: 1}
])
Proveedor.create!([
                      {name: "SIDOR", rif: "J-88362", nacional: true},
                      {name: "Ferrominera del Orinoco", rif: "J-974327", nacional: true}
                  ])
Certificado.create!([
  {numero_certificado: "45345t3453", numero_guia_proveedor: "345345", numero_codigo_producto: "43534534", numero_colada: "34534534", numero_orden_compra: "345345", proveedor_id: 1, adjunto_file_name: "lovemouse.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 79713, adjunto_updated_at: "2014-09-28 23:25:23"},
  {numero_certificado: "34535345345", numero_guia_proveedor: "546345345", numero_codigo_producto: "43534534", numero_colada: "324345345", numero_orden_compra: "3453453", proveedor_id: 1, adjunto_file_name: "ratoncito-mani.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 16914, adjunto_updated_at: "2014-09-28 23:27:15"},
  {numero_certificado: "980456546", numero_guia_proveedor: "6456", numero_codigo_producto: "345345435", numero_colada: "345345345", numero_orden_compra: "67435346", proveedor_id: 2, adjunto_file_name: "lovemouse.jpg", adjunto_content_type: "image/jpeg", adjunto_file_size: 79713, adjunto_updated_at: "2014-10-03 04:15:41"}
])

