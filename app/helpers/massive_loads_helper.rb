# encoding: UTF-8

module MassiveLoadsHelper
  
  def read_excel
    require "roo"
    file_name = "#{Rails.root}/public#{@massive_load.excel_file.url.gsub(/\?\d+\z/, "")}"
    if file_name =~ /\.xls\z/
      s = Roo::Excel.new(file_name)
    else
      s = Roo::Excelx.new(file_name)
    end
    2.upto(s.last_row) do |line|
      e_name = s.cell(line, "A")
      e_tradename = s.cell(line, "B")
      e_street = s.cell(line, "C")
      e_ext_number = s.cell(line, "D")
      e_int_number = s.cell(line, "E")
      e_colony = s.cell(line, "F")
      e_municipality = s.cell(line, "G")
      e_city = s.cell(line, "H")
      e_state = s.cell(line, "I")
      e_zip_code = s.cell(line, "J")
      #e_rfc = s.cell(line, ")
      e_lada = s.cell(line, "K")
      e_phone = s.cell(line, "L")
      a_name = s.cell(line, "M")
      a_email = s.cell(line, "N")
      #a_chat = s.cell(line, )
      #a_cellphone = s.cell(line, )
      #a_tel_nextel = s.cell(line, )
      #a_radio_nextel = s.cell(line, )
      #a_is_director = s.cell(line, )
      #a_platform = s.cell(line, )
      e_main_line = s.cell(line, "O")
      a_sec_line = s.cell(line, "P")
      #a_num_employees = s.cell(line, )
      a_other_line = s.cell(line, "P")
      a_web = s.cell(line, "Q")
      subgroup_key = s.cell(line, "A")
      e_ext_number.gsub!(/[a-zA-Z-]/, "") if !e_ext_number.nil?
      e_ext_number = 0 if e_ext_number.blank?
      e_lada = 0 if e_lada.nil?
      e_phone = 0 if e_phone.nil?
      a_email = "N/A" if a_email.nil?
      a_cellphone = "N/A" if a_cellphone.nil?
      a_platform = "N/A" if a_platform.nil?
      e_main_line = "N/A" if e_main_line.nil?
      a_sec_line = "N/A" if a_sec_line.nil?
      a_num_employees = 0 if a_num_employees.nil?
      a_other_line = "N/A" if a_other_line.nil?
      a_market_segments = { "R" => "Gobierno", "S" => "Corporativo", "T" => "PyMEs", "U" => "Educación", "V" => "Salud", "W" => "Retail", "X" => "Web" }
      a_market_segment = ""
      a_market_segments.keys.each do |k|
        a_market_segment += "#{a_market_segments[k]};" if !s.cell(line, k).nil?
      end
      subgroup_id = Subgroup.find_by_subgroup_key(subgroup_key).name
      p [e_name, e_tradename, e_street, e_ext_number, e_int_number, e_colony, e_municipality, e_city, e_state, e_zip_code, e_lada, e_phone, a_name, a_email, e_main_line, a_sec_line, a_other_line, a_web, subgroup_key]
      #Attendee.create()
    end
  end
  
end