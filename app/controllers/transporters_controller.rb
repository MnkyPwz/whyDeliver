class TransportersController < ApplicationController
  # GET /transporters
  # GET /transporters.json
  def index
    @transporters = Transporter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transporters }
    end
  end

  # GET /transporters/1
  # GET /transporters/1.json
  def show
    @transporter = Transporter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transporter }
    end
  end

  # GET /transporters/new
  # GET /transporters/new.json
  def new
    @transporter = Transporter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transporter }
    end
  end

  # GET /transporters/1/edit
  def edit
    @transporter = Transporter.find(params[:id])
  end

  # POST /transporters
  # POST /transporters.json
  def create
    @transporter = Transporter.new(params[:transporter])

    respond_to do |format|
      if @transporter.save
        format.html { redirect_to @transporter, notice: 'Transporter was successfully created.' }
        format.json { render json: @transporter, status: :created, location: @transporter }
      else
        format.html { render action: "new" }
        format.json { render json: @transporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transporters/1
  # PUT /transporters/1.json
  def update
    @transporter = Transporter.find(params[:id])

    respond_to do |format|
      if @transporter.update_attributes(params[:transporter])
        render :nothing => true
      else
        render :nothing => true
      end
    end
  end

  # DELETE /transporters/1
  # DELETE /transporters/1.json
  def destroy
    @transporter = Transporter.find(params[:id])
    @transporter.destroy

    respond_to do |format|
      format.html { redirect_to transporters_url }
      format.json { head :no_content }
    end
  end
end
