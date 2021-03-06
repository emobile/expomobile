class VisitsController < ApplicationController
  before_filter :authenticate_user!

  def visits_to_workshops_by_workshop
    if params[:subgroup_id] =~ /\A\d+\z/
      @subgroup_id = params[:subgroup_id]
    end
  end
  
  def visits_to_workshops
    @attendees = []
    @subgroups = {}
    if params[:workshop_id] =~ /\A\d+\z/ && params[:subgroup_id].blank?
      @attendees = Attendee.joins("INNER JOIN attendee_workshops a ON attendees.id = a.attendee_id")
      .where("a.workshop_id = ?", params[:workshop_id])
    elsif params[:workshop_id] =~ /\A\d+\z/ && params[:subgroup_id] =~ /\A\d+\z/
      @attendees = Attendee.joins("INNER JOIN subgroups s ON attendees.subgroup_id = s.id")
      .joins("INNER JOIN attendee_workshops a ON attendees.id = a.attendee_id")
      .where("attendees.subgroup_id = ? AND a.workshop_id = ?", params[:subgroup_id], params[:workshop_id])
    end
    @attendees.each do |a|
      a[:register_date] = AttendeeWorkshop.find_by_attendee_id_and_workshop_id(a.id, params[:workshop_id]).created_at
      subgroup_name = a.subgroup.name
      if @subgroups.has_key?(subgroup_name)
        @subgroups[subgroup_name] << a
      else
        @subgroups[subgroup_name] = [a]
      end
    end
  end
  
  def visits_to_workshops_generate_report
    @workshop = Workshop.find_by_id(params[:workshop_id])
    
    if !@workshop.nil?
      @subgroups = Subgroup.all.each do |s|
        s.attendees.each do |a|
          a[:assisted] = AttendeeWorkshop.where("attendee_id = ? AND workshop_id = ?", a.id, params[:workshop_id]).any?
        end
      end
      render layout: false
    else
      render nothing: true
    end
  end

  def visits_to_exhibitors_by_exhibitor
    
    if params[:subgroup_id] =~ /\A\d+\z/
      @subgroup_id = params[:subgroup_id]
    end
    
  end

  def visits_to_exhibitors
    @attendees = []
    @subgroups = {}
    
    if params[:exhibitor_id] =~ /\A\d+\z/
      @attendees = Attendee.joins("INNER JOIN attendee_expositions a ON attendees.id = a.attendee_id")
      .where("a.exhibitor_id = ?", params[:exhibitor_id])
    elsif
      @attendees = Attendee.joins("INNER JOIN subgroups s ON attendees.subgroup_id = s.id")
      .joins("INNER JOIN attendee_expositions a ON attendees.id = a.attendee_id")
      .where("attendees.subgroup_id = ? AND a.exhibitor_id = ?", params[:subgroup_id], params[:exhibitor_id])
    end
    
    @attendees.each do |a|
      a[:register_date] = AttendeeExposition.find_by_attendee_id_and_exhibitor_id(a.id, params[:exhibitor_id]).created_at
      subgroup_name = a.subgroup.name
      
      if @subgroups.has_key?(subgroup_name)
        @subgroups[subgroup_name] << a
      else
        @subgroups[subgroup_name] = [a]
      end
      
    end
    
  end
  
  def visits_to_exhibitors_generate_report
    @exhibitor = Exhibitor.find_by_id(params[:exhibitor_id])
    
    if !@exhibitor.nil?
      
      @subgroups = Subgroup.all.each do |s|
        
        s.attendees.each do |a|
          a[:assisted] = AttendeeExposition.where("attendee_id = ? AND exhibitor_id = ?", a.id, params[:exhibitor_id]).any?
        end
        
        s.attendees.sort_by!{ |a| [(a[:assisted])? 0: 1, a.id] }
      end
      
      render layout: false
    else
      render nothing: true
    end
    
  end
  
  #  def control_numbers_report_html
  #    
  #  end
  
  def control_numbers_report_pdf
    pdf = Prawn::Document.new do
      @system_configuration = SystemConfiguration.first
      @attendees_total = Attendee.count
      @logo_url = "#{Rails.root}/public#{@system_configuration.logo.url.gsub(/\?.*\z/, "")}"
      image @logo_url, :height => 50
      text "EXPOMOBILE", :style => :bold, :size => 14, :align => :center;
      move_down 10
      text I18n.t("visit.control_numbers_report"), :style => :bold, :size => 12, :align => :center;
      move_down 50
      table_data_1 = [[I18n.t("visit.attendees_total"), @attendees_total], [I18n.t("visit.exhibitors_total"), Exhibitor.count], [I18n.t("visit.sponsors_total"), Sponsor.count], [I18n.t("visit.workshops_total"), Workshop.count]]
      table(table_data_1) do
        column(1).font_style = :bold
        self.cell_style = { :size => 7 }
      end
      move_down 20
      text I18n.t(:attendances), :style => :bold, :size => 10
      move_down 10
      table_data_2 = [[I18n.t(:exhibitors), "#{"%.1f" % (AttendeeExposition.count * 100 / @attendees_total)}%"], [I18n.t(:workshops), "#{"%.1f" % (AttendeeWorkshop.count * 100 / @attendees_total)}%"], [I18n.t("visit.users_using_the_app"), Nip.count]]
      table(table_data_2) do
        column(1).font_style = :bold
        self.cell_style = { :size => 7 }
      end
    end.render
    respond_to do |format|
      format.pdf {
        send_data pdf, filename: "control_numbers_report_#{Date.today.to_s.gsub("-", "_")}", type: "application/pdf", disposition: "inline"
      }
    end
  end
    
end