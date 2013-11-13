class SystemConfigurationsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @system_configurations = SystemConfiguration.order('id DESC').paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @system_configurations }
    end
  end

  # GET /system_configurations/1
  # GET /system_configurations/1.json
  def show
    @system_configuration = SystemConfiguration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @system_configuration }
    end
  end

  # GET /system_configurations/1/edit
  def edit
    @system_configuration = SystemConfiguration.find(params[:id])
  end

  # PUT /system_configurations/1
  # PUT /system_configurations/1.json
  def update
    @system_configuration = SystemConfiguration.find(params[:id])

    respond_to do |format|
      if @system_configuration.update_attributes(params[:system_configuration])
        format.html { redirect_to @system_configuration, notice: 'System configuration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @system_configuration.errors, status: :unprocessable_entity }
      end
    end
  end

end