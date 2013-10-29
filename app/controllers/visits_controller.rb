class VisitsController < ApplicationController
  before_filter :authenticate_user!
  
  def visits_to_workshops_index
  end
  
  def visits_to_workshops_by_subgroup
  end

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

  def visits_to_expositions_index
  end

  def visits_to_expositions_by_subgroup
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
end