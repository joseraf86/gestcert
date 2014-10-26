Role.create!([
 {name: "admin", title: "role for admin", description: "this user can do anything", the_role: "{\"system\":{\"administrator\":true}}"},
 {name: "recepcion", title: "Recepcion de Materiales", description: "Rol para el personal que recibe materiales", the_role: "{\"certificados\":{\"index\":true,\"new\":true,\"create\":true,\"show\":true,\"edit\":false,\"delete\":false},\"proveedors\":{\"index\":true,\"show\":true,\"edit\":false,\"delete\":false}}"}
])
User.create!([
  {name: "elisa", password: "elisa", password_confirmation: "elisa", remember_created_at: nil, role_id: 2, sucursal_id: 1},
  {name: "jose", password: "jose",  password_confirmation: "jose", remember_created_at: nil, role_id: 1, sucursal_id: 2}
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