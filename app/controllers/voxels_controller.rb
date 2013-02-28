class VoxelsController < ApplicationController
  # GET /voxels
  # GET /voxels.json
  def index
    @voxels = Voxel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @voxels }
    end
  end

  # GET /voxels/1
  # GET /voxels/1.json
  def show
    @voxel = Voxel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @voxel }
    end
  end

  # GET /voxels/new
  # GET /voxels/new.json
  def new
    @voxel = Voxel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @voxel }
    end
  end

  # GET /voxels/1/edit
  def edit
    @voxel = Voxel.find(params[:id])
  end

  # POST /voxels
  # POST /voxels.json
  def create
    @voxel = Voxel.new(params[:voxel])

    respond_to do |format|
      if @voxel.save
        format.html { redirect_to @voxel, notice: 'Voxel was successfully created.' }
        format.json { render json: @voxel, status: :created, location: @voxel }
      else
        format.html { render action: "new" }
        format.json { render json: @voxel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /voxels/1
  # PUT /voxels/1.json
  def update
    @voxel = Voxel.find(params[:id])

    respond_to do |format|
      if @voxel.update_attributes(params[:voxel])
        format.html { redirect_to @voxel, notice: 'Voxel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @voxel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voxels/1
  # DELETE /voxels/1.json
  def destroy
    @voxel = Voxel.find(params[:id])
    @voxel.destroy

    respond_to do |format|
      format.html { redirect_to voxels_url }
      format.json { head :no_content }
    end
  end
end
