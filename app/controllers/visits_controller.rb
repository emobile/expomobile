class VisitsController < ApplicationController
  before_filter :authenticate_user!

  def visits_to_workshops_by_workshop
    if params[:subgroup_id] =~ /\A\d+\z/
      @subgroup_id = params[:subgroup_id]
    end
  end
  
  def visits_to_workshops
    @attendees = nil
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
      a[:register_date] = AttendeeWorkshop.find_by_attendee_id(a.id).created_at
      subgroup_name = a.subgroup.name
      if @subgroups.has_key?([subgroup_name])
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

  def visits_to_expositions_by_exposition
    if params[:subgroup_id] =~ /\A\d+\z/
      @subgroup_id = params[:subgroup_id]
    end
  end

  def visits_to_expositions
    @attendees = nil
    @subgroups = {}
    if params[:exposition_id] =~ /\A\d+\z/
      @attendees = Attendee.joins("INNER JOIN attendee_expositions a ON attendees.id = a.attendee_id")
      .where("a.exposition_id = ?", params[:exposition_id])
    elsif
      @attendees = Attendee.joins("INNER JOIN subgroups s ON attendees.subgroup_id = s.id")
      .joins("INNER JOIN attendee_expositions a ON attendees.id = a.attendee_id")
      .where("attendees.subgroup_id = ? AND a.exposition_id = ?", params[:subgroup_id], params[:exposition_id])
    end
    @attendees.each do |a|
      a[:register_date] = AttendeeExposition.find_by_attendee_id(a.id).created_at
      subgroup_name = a.subgroup.name
      if @subgroups.has_key?([subgroup_name])
        @subgroups[subgroup_name] << a
      else
        @subgroups[subgroup_name] = [a]
      end
    end
  end
  
  def visits_to_expositions_generate_report
    @exposition = Exposition.find_by_id(params[:exposition_id])
    
    if !@exposition.nil?
      @subgroups = Subgroup.all.each do |s|
        s.attendees.each do |a|
          a[:assisted] = AttendeeExposition.where("attendee_id = ? AND exposition_id = ?", a.id, params[:exposition_id]).any?
        end
      end
      render layout: false
    else
      render nothing: true
    end
  end
end