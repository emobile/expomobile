class MassiveLoadsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  include MassiveLoadsHelper

  def index
    @massive_loads = MassiveLoad.order('id DESC').paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @massive_loads }
    end
  end

  # GET /massive_loads/1
  # GET /massive_loads/1.json
  def show
    @massive_load = MassiveLoad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @massive_load }
    end
  end

  # GET /massive_loads/new
  # GET /massive_loads/new.json
  def new
    @massive_load = MassiveLoad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @massive_load }
    end
  end

  # POST /massive_loads
  # POST /massive_loads.json
  def create
    @massive_load = MassiveLoad.new(params[:massive_load])

    respond_to do |format|
      if @massive_load.save
        read_excel
        format.html { redirect_to @massive_load, notice: t(:successfully_created) }
        format.json { render json: @massive_load, status: :created, location: @massive_load }
      else
        format.html { render action: "new" }
        format.json { render json: @massive_load.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /massive_loads/1
  # DELETE /massive_loads/1.json
  def destroy
    @massive_load = MassiveLoad.find(params[:id])
    @massive_load.destroy

    respond_to do |format|
      format.html { redirect_to massive_loads_url }
      format.json { head :no_content }
    end
  end
end
