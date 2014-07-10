class Admin::CrewsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @crews = Crew.all
  end

  def new
    @crew = Crew.new
  end

  def show
    @crew = Crew.find(params[:id])
  end
end
