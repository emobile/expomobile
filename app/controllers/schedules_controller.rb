class SchedulesController < ApplicationController
  before_filter :authenticate_user!
  
  def do_association
    @schedule = nil
    @schedule = Schedule.find(params[:schedule_id]) unless params[:schedule_id].blank?
    if @schedule.nil?
      Schedule.delete_all(workshop_id: params[:workshop_id], hour_id: params[:hour_id])
      @schedule = Schedule.new(workshop_id: params[:workshop_id], subgroup_id: params[:subgroup_id], hour_id: params[:hour_id])
      if @schedule.save
        flash[:notice] = t("schedule.created")
        flash[:schedule_start_date] = @schedule.hour.start_date
      else
        flash[:error] = t("schedule.not_created")
      end
      redirect_to schedules_associate_workshop_group_path
    else
      Schedule.delete_all(workshop_id: params[:workshop_id], hour_id: params[:hour_id])
      if @schedule.update_attributes(workshop_id: params[:workshop_id], subgroup_id: params[:subgroup_id], hour_id: params[:hour_id])
        flash[:notice] = t("schedule.updated")
        flash[:schedule_start_date] = @schedule.hour.start_date
      else
        flash[:error] = t("schedule.not_updated")
        flash[:schedule_start_date] = Hour.find(params[:hour_id]).start_date
      end
      redirect_to schedules_associate_workshop_group_path
    end
  end
  
  def associate_workshop_group
    @schedule = Schedule.new
  end
  
  def deallocate
    @schedule = Schedule.find(params[:schedule_id_delete])
    flash[:schedule_start_date] = @schedule.hour.start_date
    @schedule.destroy
    flash[:notice] = t("schedule.deallocation_done")
    redirect_to schedules_associate_workshop_group_path
  end

end