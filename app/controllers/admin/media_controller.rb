class Admin::MediaController < ApplicationController
  def index
    @media = Medium.all
  end

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.new(medium_params)
      if @medium.save
      flash[:notice] = "Successfully added medium."
      redirect_to admin_medium_path(@medium.id)
    else
      flash[:notice] = "Could not add medium."
      render :new
    end
  end

  def show
    @medium = Medium.find(params[:id])
  end

  def edit
    @medium = Medium.find(params[:id])
  end

  def update
    medium = Medium.find(params[:id])
    medium.update_attributes(medium_params)
      if medium.save
      flash[:notice] = "Successfully update medium."
      redirect_to admin_medium_path(medium.id)
    else
      flash[:notice] = "Could not update medium."
      render :new
    end
  end

  private

  def medium_params
    params.require(:medium).permit(:medium)
  end
end
