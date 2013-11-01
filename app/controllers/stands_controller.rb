class StandsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @stands = Stand.order('id DESC').paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stands }
    end
  end

  # GET /stands/1
  # GET /stands/1.json
  def show
    @stand = Stand.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stand }
    end
  end

  # GET /stands/new
  # GET /stands/new.json
  def new
    @stand = Stand.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stand }
    end
  end

  # GET /stands/1/edit
  def edit
    @stand = Stand.find(params[:id])
  end

  # POST /stands
  # POST /stands.json
  def create
    @stand = Stand.new(params[:stand]) 

    respond_to do |format|
      if @stand.save
        format.html { redirect_to @stand, notice: t(:successfully_created) }
        format.json { render json: @stand, status: :created, location: @stand }
      else
        format.html { render action: "new" }
        format.json { render json: @stand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stands/1
  # PUT /stands/1.json
  def update
    @stand = Stand.find(params[:id])

    respond_to do |format|
      if @stand.update_attributes(params[:stand])
        format.html { redirect_to @stand, notice: t(:successfully_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stands/1
  # DELETE /stands/1.json
  def destroy
    @stand = Stand.find(params[:id])
    @deleted = @stand.destroy
    flash[:error] = t("stand.stand_cant_be_destroyed") if !@deleted
    
    respond_to do |format|
      format.html { redirect_to stands_url }
      format.json { head :no_content }
    end
  end

end