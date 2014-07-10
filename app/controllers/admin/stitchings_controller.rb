class Admin::StitchingsController < ApplicationController
  def index
    @stitchings = Stitching.all
  end

  def new
    @stitching = Stitching.new
  end

  def create
    @stitching = Stitching.new(stitching_params)
      if @stitching.save
      flash[:notice] = "Successfully added binding."
      redirect_to admin_stitching_path(@stitching.id)
    else
      flash[:notice] = "Could not add binding."
      render :new
    end
  end

  def show
    @stitching = Stitching.find(params[:id])
  end

  def edit
    @stitching = Stitching.find(params[:id])
  end

  def update
    stitching = Stitching.find(params[:id])
    stitching.update_attributes(stitching_params)
      if stitching.save
      flash[:notice] = "Successfully update binding."
      redirect_to admin_stitching_path(stitching.id)
    else
      flash[:notice] = "Could not update binding."
      render :new
    end
  end

  private

  def stitching_params
    params.require(:stitching).permit(:binding)
  end
end
