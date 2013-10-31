class ExpositionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @expositions = Exposition.order('id DESC').paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expositions }
    end
  end

  # GET /expositions/1
  # GET /expositions/1.json
  def show
    @exposition = Exposition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exposition }
    end
  end

  # GET /expositions/new
  # GET /expositions/new.json
  def new
    @exposition = Exposition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exposition }
    end
  end

  # GET /expositions/1/edit
  def edit
    @exposition = Exposition.find(params[:id])
  end

  # POST /expositions
  # POST /expositions.json
  def create
    
    unless params[:exposition][:start_date].nil?
      params[:exposition][:start_date] = DateTime.strptime(params[:exposition][:start_date], "%d/%m/%Y %I:%M%p") unless ((DateTime.parse(params[:exposition][:start_date]) rescue ArgumentError) == ArgumentError)
    end
    
    unless params[:exposition][:end_date].nil?
      params[:exposition][:end_date] = DateTime.strptime(params[:exposition][:end_date], "%d/%m/%Y %I:%M%p") unless ((DateTime.parse(params[:exposition][:end_date]) rescue ArgumentError) == ArgumentError)
    end
    
    @exposition = Exposition.new(params[:exposition])
    
    while @exposition.stand_key.nil?
      random_value = Array.new(3) {[*'0'..'9', *'a'..'z'].sample}.join
      @exposition = Exposition.find_by_exposition_key(random_value) || Workshop.find_by_workshop_key(random_value)
        
      if @exists.nil?
        @exposition.stand_key = random_value
      end
    end

    respond_to do |format|
      if @exposition.save
        format.html { redirect_to @exposition, notice: 'Exposition was successfully created.' }
        format.json { render json: @exposition, status: :created, location: @exposition }
      else
        format.html { render action: "new" }
        format.json { render json: @exposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expositions/1
  # PUT /expositions/1.json
  def update
    Exposition.action = "update"
    @exposition = Exposition.find(params[:id])

    respond_to do |format|
      
      unless params[:exposition][:start_date].nil?
        params[:exposition][:start_date] = DateTime.strptime(params[:exposition][:start_date], "%d/%m/%Y %I:%M%p") unless ((DateTime.parse(params[:exposition][:start_date]) rescue ArgumentError) == ArgumentError)
      end
    
      unless params[:exposition][:end_date].nil?
        params[:exposition][:end_date] = DateTime.strptime(params[:exposition][:end_date], "%d/%m/%Y %I:%M%p") unless ((DateTime.parse(params[:exposition][:end_date]) rescue ArgumentError) == ArgumentError)
      end
      
      if @exposition.update_attributes(params[:exposition])
        format.html { redirect_to @exposition, notice: 'Exposition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exposition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expositions/1
  # DELETE /expositions/1.json
  def destroy
    @exposition = Exposition.find(params[:id])
    @exposition.destroy

    respond_to do |format|
      format.html { redirect_to expositions_url }
      format.json { head :no_content }
    end
  end
end
