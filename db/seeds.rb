#-*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: "Super administrator", is_super_admin: true)
Role.create(name: "Administrator")

User.create(first_name: 'System', last_name: 'Administrator', phone: '6141111111', address: 'Address 1', city: 'Chihuahua', state: 'Chihuahua', zip: 33333, country: 'México', username: 'administrator', email: 'emobile@emobile.com.mx', password: 'Password1', password_confirmation: 'Password1', confirmed_at: Date.today, role_id: 1)

#Exhibitor.create(name: "HP", exposition_key: "e11", contact: "Julián González", social_reason: "HP", job: "Representante de ventas", logo: File.open("#{Rails.root}/app/assets/images/hp.jpg"), stand_location: "Stand 1", stand_size: "3x3")

#Offert.create(exhibitor_id: '1', description: 'Computadora', price: '5000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 1")
#Offert.create(exhibitor_id: '1', description: 'Impresora', price: '1000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 1")
#Offert.create(exhibitor_id: '1', description: 'Laptop', price: '12000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 1")
#Offert.create(exhibitor_id: '2', description: 'Router', price: '12000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 2")
#Offert.create(exhibitor_id: '2', description: 'Switch', price: '7000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 2")
#Offert.create(exhibitor_id: '2', description: 'Antena', price: '10000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 2")

#Room.create(name: 'SATURN 1', room_key: 'S1')
#Room.create(name: 'SATURN 2', room_key: 'S2')
#Room.create(name: 'SATURN 3', room_key: 'S3')
#Room.create(name: 'JUPITER 1', room_key: 'J1')
#Room.create(name: 'JUPITER 2', room_key: 'J2')
#Room.create(name: 'JUPITER 3', room_key: 'J3')
#Room.create(name: 'JUPITER 4', room_key: 'J4')
#Room.create(name: 'JUPITER 5', room_key: 'J5')
#Room.create(name: 'JUPITER 6', room_key: 'J6')
#Room.create(name: 'MARS 1', room_key: 'M1')

#Workshop.create(name: 'PATROC 11', workshop_key: 'w11', teacher_name: 'José López', room_id: '1')
#Workshop.create(name: 'PATROC 12', workshop_key: 'w22', teacher_name: 'Ramón González', room_id: '2')
#Workshop.create(name: 'PATROC 13', workshop_key: 'w33', teacher_name: 'Jorge Luna', room_id: '3')
#Workshop.create(name: 'PATROC 14', workshop_key: 'w44', teacher_name: 'Juan Torres', room_id: '4')
#Workshop.create(name: 'PATROC 15', workshop_key: 'w55', teacher_name: 'Osiel Bonilla', room_id: '5')
#Workshop.create(name: 'PATROC 16', workshop_key: 'w66', teacher_name: 'Alejandro Ballesteros', room_id: '6')
#Workshop.create(name: 'PATROC 17', workshop_key: 'w77', teacher_name: 'Diana Chacón', room_id: '7')
#Workshop.create(name: 'PATROC 18', workshop_key: 'w88', teacher_name: 'Francisco Ruiz', room_id: '8')
#Workshop.create(name: 'PATROC 19', workshop_key: 'w99', teacher_name: 'Raul Maese', room_id: '9')
#Workshop.create(name: 'PATROC 10', workshop_key: 'w10', teacher_name: 'Alejandro Machado', room_id: '10')

Group.create(name: "Grupo 1")
Group.create(name: "Grupo 2")

Subgroup.create(name: 'Francisco Villa', leader: "Sonia Rodríguez", subgroup_key: 'FV', group_id: '1')
Subgroup.create(name: 'Emiliano Zapata', leader: "Armando Rodarte", subgroup_key: 'EZ', group_id: '1')
Subgroup.create(name: 'Álvaro Obregón', leader: "Adriana Flores", subgroup_key: 'AO', group_id: '1')
Subgroup.create(name: 'Venustiano Carranza', leader: "Harim García", subgroup_key: 'VC', group_id: '1')
Subgroup.create(name: 'Francisco I Madero', leader: "Erik García", subgroup_key: 'FI', group_id: '1')
Subgroup.create(name: 'Porfirio Díaz', leader: "Ricardo Orellana", subgroup_key: 'PD', group_id: '1')
Subgroup.create(name: 'Eulalio Gutierrez', leader: "Gabriel Chávez", subgroup_key: 'EG', group_id: '1')
Subgroup.create(name: 'Pascual Orozco', leader: "Jaime Juárez", subgroup_key: 'PO', group_id: '1')
Subgroup.create(name: 'Victoriano Huerta', leader: "Juan M. Suárez", subgroup_key: 'VH', group_id: '1')
Subgroup.create(name: 'Manuel Mondragón', leader: "Joaquín Reyes", subgroup_key: 'MM', group_id: '1')
Subgroup.create(name: 'José Vasconcelos', leader: "Sonia Rodríguez", subgroup_key: 'JV', group_id: '2')
Subgroup.create(name: 'Ricardo Flores Magón', leader: "Armando Rodarte", subgroup_key: 'RF', group_id: '2')
Subgroup.create(name: 'Aquiles Serdán', leader: "Adriana Flores", subgroup_key: 'AS', group_id: '2')
Subgroup.create(name: 'José Ma Pino Suárez', leader: "Harim García", subgroup_key: 'JP', group_id: '2')
Subgroup.create(name: 'Belisario Dominguez', leader: "Erik García", subgroup_key: 'BD', group_id: '2')
Subgroup.create(name: 'León De La Barra', leader: "Ricardo Orellana", subgroup_key: 'LB', group_id: '2')
Subgroup.create(name: 'José Limantour', leader: "Gabriel Chávez", subgroup_key: 'JL', group_id: '2')
Subgroup.create(name: 'Ramón Corral', leader: "Jaime Juárez", subgroup_key: 'RC', group_id: '2')
Subgroup.create(name: 'Bernardo Reyes', leader: "Juan M. Suárez", subgroup_key: 'BR', group_id: '2')
Subgroup.create(name: 'Filomeno Mata', leader: "Joaquín Reyes", subgroup_key: 'FM', group_id: '2')
Subgroup.create(name: 'Andrés Molina', leader: "Manuel Sánchez", subgroup_key: 'AM', group_id: '2')
Subgroup.create(name: 'Heriberto Jara', leader: "Manuel Sánchez", subgroup_key: 'HJ', group_id: '2')
Subgroup.create(name: 'Otilio Montaño', leader: "Arturo Ramírez", subgroup_key: 'OM', group_id: '2')
Subgroup.create(name: 'Luis Cabrera', leader: "Arturo Ramírez", subgroup_key: 'LC', group_id: '2')

#Attendee.create(attendee_id: 'C123', subgroup_id: 1, e_name: 'INNOVACIÓN Y CONSULTORÍA MÓVIL S.C', e_tradename: 'eMobile', e_street: 'AVENIDA HEROICO COLEGIO MILITAR', e_ext_number: '4709', e_colony: '4709', e_municipality: 'CHIHUAHUA', e_city: 'CHIHUAHUA', e_state: 'CHIHUAHUA', e_zip_code: '31105', e_rfc: 'ICM100705V13', e_lada: '614', e_phone: '4191895', a_name: 'OSIEL BONILLA QUEZADA', a_email: 'osielbq@gmail.com', a_cellphone: '6141111111', a_platform: 'Android;', e_main_line: 'Aplicaciones Web', a_sec_line: 'Capacitación', a_num_employees: '7', a_other_line: 'Desarrollo', a_market_segment: 'Gobierno;Corporativo;Pymes;Web;')

#Hour.create(start_date: 'Mon, 25 Nov 2013 08:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 08:30:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 08:40:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 09:10:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 09:20:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 09:50:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 10:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 10:30:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 10:40:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 11:10:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 11:20:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 11:50:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 12:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 12:30:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 12:40:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 13:10:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 13:20:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 13:50:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 14:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 14:30:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 18:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 18:30:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 18:40:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 19:10:00 UTC +00:00')
#Hour.create(start_date: 'Mon, 25 Nov 2013 19:20:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 19:50:00 UTC +00:00')
#Hour.create(start_date: 'Tue, 26 Nov 2013 08:00:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 08:30:00 UTC +00:00')
#Hour.create(start_date: 'Tue, 26 Nov 2013 08:40:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 09:10:00 UTC +00:00')
#Hour.create(start_date: 'Tue, 26 Nov 2013 09:20:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 09:50:00 UTC +00:00')
#Hour.create(start_date: 'Tue, 26 Nov 2013 10:00:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 10:30:00 UTC +00:00')
#Hour.create(start_date: 'Tue, 26 Nov 2013 10:40:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 11:10:00 UTC +00:00')
#Hour.create(start_date: 'Tue, 26 Nov 2013 11:20:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 11:50:00 UTC +00:00')
#Hour.create(start_date: 'Tue, 26 Nov 2013 12:00:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 12:30:00 UTC +00:00')

#Exposition.create(name: "Exposition 1", start_date: 'Mon, 25 Nov 2013 08:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 08:30:00 UTC +00:00', location: "Ubicación")

#Sponsor.create(name: "HP México", contact: "Julián Soto", job: "Gerente de ventas", social_reason: "HP México", work_street: "C. Samalayuca", work_street_number: "123", work_colony: "Col. Obrera", work_zip: "31375", web_page: "hpmexico.com", phone: "4123456", email: "juliansoto@gmail.com", twitter: "@juliansoto", logo: File.open("#{Rails.root}/app/assets/images/hp.jpg"))

#Conference.create(name: "Software Libre", conferencist: "Miguel Ramos", start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 11 Sep 2013 18:05:00 UTC +00:00', place: "Salón 1")

#Activity.create(name: "Disco 80's", start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 11 Sep 2013 18:05:00 UTC +00:00', place: "Salón 1")
  
#FaceToFace.create(attendee_id: 1, start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 11 Sep 2013 18:05:00 UTC +00:00', int_contact: "Julián González", int_job: "Gerente de ventas", int_name: "HP", subject: "Convenio con empresa")

SystemConfiguration.create(token: "emobile", workshop_tolerance: 15, exposition_tolerance: 15, logo: File.open("#{Rails.root}/app/assets/images/anadic.png"), banner: File.open("#{Rails.root}/app/assets/images/congreso.png"))