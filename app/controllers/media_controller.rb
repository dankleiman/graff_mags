class MediaController < ApplicationController
  before_action :authenticate_admin!

  def index
    @media = Medium.all
  end

  def new
    @medium = Medium.new
  end

  def create
    @medium = Medium.find_or_create_by(medium_params)
      if @medium.save
      flash[:notice] = "Successfully added medium."
      redirect_to medium_path(@medium.id)
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
      redirect_to medium_path(medium.id)
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
