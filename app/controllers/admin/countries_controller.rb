class Admin::CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.find_or_create_by(country_params)
      if @country.save
      flash[:notice] = "Successfully added Country."
      redirect_to admin_country_path(@country.id)
    else
      flash[:notice] = "Could not add Country."
      render :new
    end
  end

  def show
    @country = Country.find(params[:id])
  end

  def edit
    @country = Country.find(params[:id])
  end

  def update
    country = Country.find(params[:id])
    country.update_attributes(country_params)
      if country.save
      flash[:notice] = "Successfully update country."
      redirect_to admin_country_path(country.id)
    else
      flash[:notice] = "Could not update country."
      render :new
    end
  end

  def destroy
    country = Country.find(params[:id])
    if country.destroy
      flash[:notice] = "Successfully deleted."
    else
      flash[:notice] = "Could not delete."
    end
    redirect_to admin_countries_path
  end

  private

  def country_params
    params.require(:country).permit(:country)
  end
end
