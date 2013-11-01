class WorkshopsController < ApplicationController

  def index
    @workshops = Workshop.order('id DESC').paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workshops }
    end
  end

  # GET /workshops/1
  # GET /workshops/1.json
  def show
    @workshop = Workshop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @workshop }
    end
  end

  # GET /workshops/new
  # GET /workshops/new.json
  def new
    @workshop = Workshop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workshop }
    end
  end

  # GET /workshops/1/edit
  def edit
    @workshop = Workshop.find(params[:id])
  end

  # POST /workshops
  # POST /workshops.json
  def create
    @workshop = Workshop.new(params[:workshop])

    while @workshop.workshop_key.nil?
      random_value = Array.new(3) {[*'0'..'9', *'a'..'z'].sample}.join
      @exists = Workshop.find_by_workshop_key(random_value) || Stand.find_by_stand_key(random_value)
        
      if @exists.nil?
        @workshop.workshop_key = random_value
      end
    end

    respond_to do |format|
      if @workshop.save
        format.html { redirect_to @workshop, notice: t(:successfully_created) }
        format.json { render json: @workshop, status: :created, location: @workshop }
      else
        format.html { render action: "new" }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workshops/1
  # PUT /workshops/1.json
  def update
    @workshop = Workshop.find(params[:id])

    respond_to do |format|
      if @workshop.update_attributes(params[:workshop])
        format.html { redirect_to @workshop, notice: t(:successfully_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workshop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workshops/1
  # DELETE /workshops/1.json
  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy

    respond_to do |format|
      format.html { redirect_to workshops_url }
      format.json { head :no_content }
    end
  end
  
  def set_tolerance
    if !params[:tolerance].blank?
      if SystemConfigurations.first.update_attributes(workshop_tolerance: params[:tolerance])
        flash[:notice] = t(:tolerance_set_successfully)
      else
        flash[:error] = t(:tolerance_not_set)
      end
    end
    redirect_to workshops_path
  end
  
end
