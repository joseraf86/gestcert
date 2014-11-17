Role.create!([
  {name: "admin", title: "role for admin", description: "this user can do anything", the_role: "{\"system\":{\"administrator\":true}}"},
  {name: "deposito", title: "Recepcion de Materiales", description: "Rol para el personal que recibe materiales", the_role: "{\"certificados\":{\"index\":true,\"new\":true,\"create\":true,\"show\":true,\"edit\":true,\"destroy\":true,\"update\":true},\"proveedors\":{\"index\":true,\"show\":true},\"productos\":{\"index\":true,\"show\":true},\"sucursals\":{\"index\":true,\"show\":true},\"home\":{\"index\":true}}"},
  {name: "ventas", title: "Ventas", description: "Ventas", the_role: "{\"certificados\":{\"show\":true,\"index\":true},\"productos\":{\"show\":true,\"index\":true},\"sucursals\":{\"index\":true,\"show\":true},\"home\":{\"index\":true},\"proveedors\":{\"index\":true,\"show\":true}}"}
])
User.create!([
  {name: "admin", password: "admin", password_confirmation: "admin", remember_created_at: nil, role_id: 1, sucursal_id: 1},
  {name: "deposito-caracas", password: "caracas", password_confirmation: "caracas", remember_created_at: nil, role_id: 2, sucursal_id: 1},
  {name: "deposito-san-joaquin", password: "san-joaquin", password_confirmation: "san-joaquin", remember_created_at: nil, role_id: 2, sucursal_id: 2},
  {name: "deposito-barquisimeto", password: "barquisimeto", password_confirmation: "barquisimeto", remember_created_at: nil, role_id: 2, sucursal_id: 3},
  {name: "deposito-puerto-ordaz", password: "puerto-ordaz", password_confirmation: "puerto-ordaz", remember_created_at: nil, role_id: 2, sucursal_id: 4},
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

