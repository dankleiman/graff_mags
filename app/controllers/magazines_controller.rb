class MagazinesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :update]

  def show
    @magazine = Magazine.find(params[:id])
  end

  def update
    magazine = Magazine.find(params[:id])
    magazine.update_attributes(magazine_params)
    if magazine.save
      flash[:notice] = "Successfully updated."
      redirect_to magazine_path(magazine.id)
    else
      flash[:notice] = "Could not update magazine."
      render :new
    end
  end

  def new
    @magazine = Magazine.new
  end

  def create
    @magazine=Magazine.find_or_create_by(magazine_params)
      if @magazine.save
      flash[:notice] = "Successfully added magazine."
      redirect_to magazine_path(@magazine.id)
    else
      flash[:notice] = "Could not add magazine."
      render :new
    end
  end

  private

  def magazine_params
    params.require(:magazine).permit(:title, :alternate_titles)
  end
end
