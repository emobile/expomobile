class ExhibitorsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:with_offerts] == "1"
      @exhibitors = Exhibitor.joins("RIGHT OUTER JOIN offerts o ON exhibitors.id = o.exhibitor_id").uniq
      @exhibitors.each {|e| e[:mobile_logo_url] = e.logo.url(:mobile)}
    else
      @exhibitors = Exhibitor.order('id DESC').paginate(:per_page => 10, :page => params[:page])
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exhibitors }
    end
  end

  # GET /exhibitors/1
  # GET /exhibitors/1.json
  def show
    @exhibitor = Exhibitor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exhibitor }
    end
  end

  # GET /exhibitors/new
  # GET /exhibitors/new.json
  def new
    @exhibitor = Exhibitor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exhibitor }
    end
  end

  # GET /exhibitors/1/edit
  def edit
    @exhibitor = Exhibitor.find(params[:id])
  end

  # POST /exhibitors
  # POST /exhibitors.json
  def create
    @exhibitor = Exhibitor.new(params[:exhibitor])

    respond_to do |format|
      if @exhibitor.save
        format.html { redirect_to @exhibitor, notice: 'Exhibitor was successfully created.' }
        format.json { render json: @exhibitor, status: :created, location: @exhibitor }
      else
        format.html { render action: "new" }
        format.json { render json: @exhibitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exhibitors/1
  # PUT /exhibitors/1.json
  def update
    @exhibitor = Exhibitor.find(params[:id])

    respond_to do |format|
      if @exhibitor.update_attributes(params[:exhibitor])
        format.html { redirect_to @exhibitor, notice: 'Exhibitor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exhibitor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exhibitors/1
  # DELETE /exhibitors/1.json
  def destroy
    @exhibitor = Exhibitor.find(params[:id])
    @exhibitor.destroy

    respond_to do |format|
      format.html { redirect_to exhibitors_url }
      format.json { head :no_content }
    end
  end
end
