class Admin::CrewsController < ApplicationController
  def index
    @crews = Crew.all
  end

  def new
    @crew = Crew.new
  end

  def create
    @crew = Crew.find_or_create_by(crew_params)
      if @crew.save
      flash[:notice] = "Successfully added crew."
      redirect_to admin_crew_path(@crew.id)
    else
      flash[:alert] = "Could not add crew."
      render :new
    end
  end

  def show
    @crew = Crew.find(params[:id])
  end

  def edit
    @crew = Crew.find(params[:id])
  end

  def update
    crew = Crew.find(params[:id])
    crew.update_attributes(crew_params)
      if crew.save
      flash[:notice] = "Successfully update crew."
      redirect_to admin_crew_path(crew.id)
    else
      flash[:alert] = "Could not update crew."
      render :new
    end
  end

  def destroy
    crew = Crew.find(params[:id])
    if crew.destroy
      flash[:notice] = "Successfully deleted."
    else
      flash[:alert] = "Could not delete."
    end
    redirect_to admin_crews_path
  end

  private

  def crew_params
    params.require(:crew).permit(:crew)
  end
end
