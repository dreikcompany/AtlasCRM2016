# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Crea los usuarios del sistema por defecto
user = User.create([{username: 'jose', email: 'dreik_2033@hotmail.com', clave: '20920418', foto: 'S/F',
 p_secreta: 'lema', r_secreta:'jose', estatus:'A', role_id: 1}])

user = User.create([{username: 'alfredo', email: 'almavalo11@gmail.com', clave: '20017764', foto: 'S/F',
 p_secreta: 'lema', r_secreta:'alfredo', estatus:'A', role_id: 4}])

user = User.create([{username: 'saul', email: 'saul.ramos.2609@gmail.com', clave: '21461653', foto: 'S/F',
 p_secreta: 'lema', r_secreta:'saul', estatus:'A', role_id: 2}])

user = User.create([{username: 'gleiber', email: 'gleiber05@gmail.com', clave: '19424443', foto: 'S/F',
p_secreta: 'lema', r_secreta:'gleiber', estatus:'A', role_id: 3}])

user = User.create([{username: 'yiyi', email: 'yiyi@gmail.com', clave: '12345678', foto: 'S/F',
 p_secreta: 'lema', r_secreta:'yiyi', estatus:'A', role_id: 5}])

#Crea los roles del sistema por defecto
role = Role.create([{nombre: 'ADMINISTRADOR', estatus: 'A'}])
role = Role.create([{nombre: 'EMPRESA', estatus: 'A'}])
role = Role.create([{nombre: 'ANALISTA', estatus: 'A'}])
role = Role.create([{nombre: 'EJECUTIVO', estatus: 'A'}])
role = Role.create([{nombre: 'CLIENTE', estatus: 'A'}])

#Crea las Membresias
membership = Membership.create([{nombre: 'GRATIS',monto: '0' ,estatus: 'A' }])
membership = Membership.create([{nombre: 'ESTANDAR',monto: '39000' ,estatus: 'A' }])
membership = Membership.create([{nombre: 'SEMIPROFESIONAL',monto: '99000' ,estatus: 'A' }])
membership = Membership.create([{nombre: 'PROFESIONAL',monto: '199000' ,estatus: 'A' }])

