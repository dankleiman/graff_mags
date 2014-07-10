class CrewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @crews = Crew.all
  end

  def create
    @crew = Crew.find_or_create_by(crew_params)
      if @crew.save
      flash[:notice] = "Successfully added crew."
      redirect_to crew_path(@crew.id)
    else
      flash[:notice] = "Could not add crew."
      render :new
    end
  end

  def show
    @crew = Crew.find(params[:id])
  end

  def edit
    @crew = Crew.find(params[:id])
  end

  private

  def crew_params
    params.require(:crew).permit(:crew)
  end
end
