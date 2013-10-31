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

Exhibitor.create(name: "Julián González", social_reason: "HP", job: "Representante de ventas", logo: File.open("#{Rails.root}/app/assets/images/hp.jpg"))
Exhibitor.create(name: "Manuel Lara", social_reason: "CISCO", job: "Representante de ventas", logo: File.open("#{Rails.root}/app/assets/images/cisco.gif"))

Offert.create(exhibitor_id: '1', description: 'Computadora', price: '5000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 1")
Offert.create(exhibitor_id: '1', description: 'Impresora', price: '1000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 1")
Offert.create(exhibitor_id: '1', description: 'Laptop', price: '12000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 1")
Offert.create(exhibitor_id: '2', description: 'Router', price: '12000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 2")
Offert.create(exhibitor_id: '2', description: 'Switch', price: '7000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 2")
Offert.create(exhibitor_id: '2', description: 'Antena', price: '10000', start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 18 Sep 2013 18:05:00 UTC +00:00', location: "Stand 2")

Room.create(name: 'SATURN 1', room_key: 'S1')
Room.create(name: 'SATURN 2', room_key: 'S2')
Room.create(name: 'SATURN 3', room_key: 'S3')
Room.create(name: 'JUPITER 1', room_key: 'J1')
Room.create(name: 'JUPITER 2', room_key: 'J2')
Room.create(name: 'JUPITER 3', room_key: 'J3')
Room.create(name: 'JUPITER 4', room_key: 'J4')
Room.create(name: 'JUPITER 5', room_key: 'J5')
Room.create(name: 'JUPITER 6', room_key: 'J6')
Room.create(name: 'MARS 1', room_key: 'M1')

Workshop.create(name: 'PATROC 11', workshop_key: 'w11', teacher_name: 'José López', room_id: '1')
Workshop.create(name: 'PATROC 12', workshop_key: 'w22', teacher_name: 'Ramón González', room_id: '2')
Workshop.create(name: 'PATROC 13', workshop_key: 'w33', teacher_name: 'Jorge Luna', room_id: '3')
Workshop.create(name: 'PATROC 14', workshop_key: 'w44', teacher_name: 'Juan Torres', room_id: '4')
Workshop.create(name: 'PATROC 15', workshop_key: 'w55', teacher_name: 'Osiel Bonilla', room_id: '5')
Workshop.create(name: 'PATROC 16', workshop_key: 'w66', teacher_name: 'Alejandro Ballesteros', room_id: '6')
Workshop.create(name: 'PATROC 17', workshop_key: 'w77', teacher_name: 'Diana Chacón', room_id: '7')
Workshop.create(name: 'PATROC 18', workshop_key: 'w88', teacher_name: 'Francisco Ruiz', room_id: '8')
Workshop.create(name: 'PATROC 19', workshop_key: 'w99', teacher_name: 'Raul Maese', room_id: '9')
Workshop.create(name: 'PATROC 10', workshop_key: 'w10', teacher_name: 'Alejandro Machado', room_id: '10')

Group.create(name: "Grupo 1")
Group.create(name: "Grupo 2")

Subgroup.create(name: 'Francisco Villa', leader: "Juan Torres", subgroup_key: 'FV', group_id: '1')
Subgroup.create(name: 'Emiliano Zapata', leader: "Jorge Luna", subgroup_key: 'EZ', group_id: '1')
Subgroup.create(name: 'Álvaro Obregón', leader: "Osiel Bonilla", subgroup_key: 'AO', group_id: '1')
Subgroup.create(name: 'Venustiano Carranza', leader: "Raúl Maese", subgroup_key: 'VC', group_id: '1')
Subgroup.create(name: 'Francisco I Madero', leader: "Diana Chacón", subgroup_key: 'FM', group_id: '1')
Subgroup.create(name: 'Porfirio Díaz', leader: "Juan Torres", subgroup_key: 'PD', group_id: '1')
Subgroup.create(name: 'Eulalio Gutierrez', leader: "Jorge Luna", subgroup_key: 'EG', group_id: '1')
Subgroup.create(name: 'Pascual Orozco', leader: "Osiel Bonilla", subgroup_key: 'PO', group_id: '1')
Subgroup.create(name: 'Victoriano Huerta', leader: "Raúl Maese", subgroup_key: 'VH', group_id: '1')
Subgroup.create(name: 'Manuel Mondragón', leader: "Diana Chacón", subgroup_key: 'MM', group_id: '1')
Subgroup.create(name: 'José Vasconcelos', leader: "Francisco Ruiz", subgroup_key: 'JV', group_id: '2')
Subgroup.create(name: 'Ricardo Flores Magón', leader: "Francisco Ruiz", subgroup_key: 'RF', group_id: '2')
Subgroup.create(name: 'Aquiles Serdán', leader: "Alejandra Navarro", subgroup_key: 'AS', group_id: '2')
Subgroup.create(name: 'José Ma Pino Suárez', leader: "Alejandra Navarro", subgroup_key: 'JP', group_id: '2')
Subgroup.create(name: 'Belisario Dominguez', leader: "Gilberto Bravo", subgroup_key: 'BD', group_id: '2')
Subgroup.create(name: 'León De La Barra', leader: "Gilberto Bravo", subgroup_key: 'LD', group_id: '2')
Subgroup.create(name: 'José Limantour', leader: "Juan Pérez", subgroup_key: 'JL', group_id: '2')
Subgroup.create(name: 'Ramón Corral', leader: "Juan Pérez", subgroup_key: 'RC', group_id: '2')
Subgroup.create(name: 'Bernardo Reyes', leader: "Camilo Canasto", subgroup_key: 'BR', group_id: '2')
Subgroup.create(name: 'Filomeno Mata', leader: "Camilo Canasto", subgroup_key: 'FA', group_id: '2')

Attendee.create(attendee_id: 'C123', subgroup_id: 1, e_name: 'INNOVACIÓN Y CONSULTORÍA MÓVIL S.C', e_tradename: 'eMobile', e_street: 'AVENIDA HEROICO COLEGIO MILITAR', e_ext_number: '4709', e_colony: '4709', e_municipality: 'CHIHUAHUA', e_city: 'CHIHUAHUA', e_state: 'CHIHUAHUA', e_zip_code: '31105', e_rfc: 'ICM100705V13', e_lada: '614', e_phone: '4191895', a_name: 'OSIEL BONILLA QUEZADA', a_email: 'osielbq@gmail.com', a_cellphone: '6141111111', a_platform: 'Android;', e_main_line: 'Aplicaciones Web', a_sec_line: 'Capacitación', a_num_employees: '7', a_other_line: 'Desarrollo', a_market_segment: 'Gobierno;Corporativo;Pymes;Web;')
Attendee.create(attendee_id: 'C456', subgroup_id: 2, e_name: 'INNOVACIÓN Y CONSULTORÍA MÓVIL S.C', e_tradename: 'eMobile', e_street: 'AVENIDA HEROICO COLEGIO MILITAR', e_ext_number: '4709', e_colony: '4709', e_municipality: 'CHIHUAHUA', e_city: 'CHIHUAHUA', e_state: 'CHIHUAHUA', e_zip_code: '31105', e_rfc: 'ICM100705V13', e_lada: '614', e_phone: '4191895', a_name: 'JUAN TORRES REYES', a_email: 'jtorres@emobile.com.mx', a_cellphone: '6141111111', a_is_director: true, a_platform: 'Android;', e_main_line: 'Aplicaciones Web', a_sec_line: 'Capacitación', a_num_employees: '7', a_other_line: 'Desarrollo', a_market_segment: 'Gobierno;Corporativo;Pymes;Web;')
Attendee.create(attendee_id: 'C789', subgroup_id: 3, e_name: 'INNOVACIÓN Y CONSULTORÍA MÓVIL S.C', e_tradename: 'eMobile', e_street: 'AVENIDA HEROICO COLEGIO MILITAR', e_ext_number: '4709', e_colony: '4709', e_municipality: 'CHIHUAHUA', e_city: 'CHIHUAHUA', e_state: 'CHIHUAHUA', e_zip_code: '31105', e_rfc: 'ICM100705V13', e_lada: '614', e_phone: '4191895', a_name: 'JORGE ALBERTO LUNA QUINTANILLA', a_email: 'seguidor777@gmail.com', a_cellphone: '6141111111', a_platform: 'Android;', e_main_line: 'Aplicaciones Web', a_sec_line: 'Capacitación', a_num_employees: '7', a_other_line: 'Desarrollo', a_market_segment: 'Gobierno;Corporativo;Pymes;Web;')
Attendee.create(attendee_id: 'C012', subgroup_id: 3, e_name: 'INNOVACIÓN Y CONSULTORÍA MÓVIL S.C', e_tradename: 'eMobile', e_street: 'AVENIDA HEROICO COLEGIO MILITAR', e_ext_number: '4709', e_colony: '4709', e_municipality: 'CHIHUAHUA', e_city: 'CHIHUAHUA', e_state: 'CHIHUAHUA', e_zip_code: '31105', e_rfc: 'ICM100705V13', e_lada: '614', e_phone: '4191895', a_name: 'RAUL MAESE CARO', a_email: 'rmaese@emobile.com.mx', a_cellphone: '6141111111', a_platform: 'Android;', e_main_line: 'Aplicaciones Web', a_sec_line: 'Capacitación', a_num_employees: '7', a_other_line: 'Desarrollo', a_market_segment: 'Gobierno;Corporativo;Pymes;Web;')

Hour.create(start_date: 'Mon, 25 Nov 2013 08:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 08:30:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 08:40:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 09:10:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 09:20:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 09:50:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 10:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 10:30:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 10:40:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 11:10:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 11:20:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 11:50:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 12:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 12:30:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 12:40:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 13:10:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 13:20:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 13:50:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 14:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 14:30:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 18:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 18:30:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 18:40:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 19:10:00 UTC +00:00')
Hour.create(start_date: 'Mon, 25 Nov 2013 19:20:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 19:50:00 UTC +00:00')
Hour.create(start_date: 'Tue, 26 Nov 2013 08:00:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 08:30:00 UTC +00:00')
Hour.create(start_date: 'Tue, 26 Nov 2013 08:40:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 09:10:00 UTC +00:00')
Hour.create(start_date: 'Tue, 26 Nov 2013 09:20:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 09:50:00 UTC +00:00')
Hour.create(start_date: 'Tue, 26 Nov 2013 10:00:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 10:30:00 UTC +00:00')
Hour.create(start_date: 'Tue, 26 Nov 2013 10:40:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 11:10:00 UTC +00:00')
Hour.create(start_date: 'Tue, 26 Nov 2013 11:20:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 11:50:00 UTC +00:00')
Hour.create(start_date: 'Tue, 26 Nov 2013 12:00:00 UTC +00:00', end_date: 'Tue, 26 Nov 2013 12:30:00 UTC +00:00')

Stand.create(name: "Stand 1", exhibitor_id: 1)
Stand.create(name: "Stand 2", exhibitor_id: 1)
Stand.create(name: "Stand 3", exhibitor_id: 1) 

Exposition.create(name: "Exposition 1", exposition_key: "e11", start_date: 'Mon, 25 Nov 2013 08:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 08:30:00 UTC +00:00', stand_id: 1, exhibitor_id: 1)
Exposition.create(name: "Exposition 2", exposition_key: "e22", start_date: 'Mon, 25 Nov 2013 08:00:00 UTC +00:00', end_date: 'Mon, 25 Nov 2013 08:30:00 UTC +00:00', stand_id: 2, exhibitor_id: 2)

AttendeeExposition.create(attendee_id: 1, exposition_id: 1)
AttendeeExposition.create(attendee_id: 2, exposition_id: 2)
AttendeeExposition.create(attendee_id: 3, exposition_id: 3)

AttendeeWorkshop.create(attendee_id: 1, workshop_id: 1)
AttendeeWorkshop.create(attendee_id: 2, workshop_id: 2)
AttendeeWorkshop.create(attendee_id: 3, workshop_id: 3)

Sponsor.create(name: "Julián Soto", job: "Gerente de ventas", social_reason: "HP México", work_address: "C. Samalayuca #123", web_page: "hpmexico.com", phone: "4123456", email: "juliansoto@gmail.com", facebook: "www.facebook.com/juliansoto", twitter: "@juliansoto", logo: File.open("#{Rails.root}/app/assets/images/hp.jpg"))
Sponsor.create(name: "Carlos Muñoz", job: "Tesorero", social_reason: "Microsoft México", work_address: "C. Tarahumara #456", web_page: "microsoftmexico.com", phone: "4789123", email: "carlosmunoz@gmail.com", facebook: "www.facebook.com/carlosmunoz", twitter: "carlosmunoz", logo: File.open("#{Rails.root}/app/assets/images/microsoft.png"))
Sponsor.create(name: "Victor Pérez", job: "Líder de proyectos", social_reason: "BIT technologies", work_address: "C. Independencia #789", web_page: "bittechnologies.com", phone: "4456789", email: "victorperez@gmail.com", facebook: "www.facebook.com/victorperez", twitter: "victorperez", logo: File.open("#{Rails.root}/app/assets/images/bit.png"))

SystemConfigurations.create(token: "emobile", workshop_tolerance: 15, exposition_tolerance: 15)

Conference.create(name: "Software Libre", conferencist: "Miguel Ramos", start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 11 Sep 2013 18:05:00 UTC +00:00', place: "Salón 1")
Conference.create(name: "Seguridad Informática", conferencist: "José Rosales", start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 11 Sep 2013 18:05:00 UTC +00:00', place: "Salón 2")
Conference.create(name: "Virtualización", conferencist: "Victoria Loya", start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 11 Sep 2013 18:05:00 UTC +00:00', place: "Salón 3")

Activity.create(name: "Disco 80's", start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 11 Sep 2013 18:05:00 UTC +00:00', place: "Salón 1")
  
FaceToFace.create(attendee_id: 1, start_date: 'Wed, 11 Sep 2013 17:05:00 UTC +00:00', end_date: 'Wed, 11 Sep 2013 18:05:00 UTC +00:00', int_name: "Julián González", int_social_reason: "HP", int_job: "Gerente de ventas", subject: "Convenio con empresa")
