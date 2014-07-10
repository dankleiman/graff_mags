class FormatsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @formats = Format.all
  end

  def new
    @format = Format.new
  end

  def create
    @format = Format.find_or_create_by(format_params)
      if @format.save
      flash[:notice] = "Successfully added format."
      redirect_to format_path(@format.id)
    else
      flash[:notice] = "Could not add format."
      render :new
    end
  end

  def show
    @format = Format.find(params[:id])
  end

  def edit
    @format = Format.find(params[:id])
  end

  def update
    format = Format.find(params[:id])
    format.update_attributes(format_params)
      if format.save
      flash[:notice] = "Successfully update format."
      redirect_to format_path(format.id)
    else
      flash[:notice] = "Could not update format."
      render :new
    end
  end

  private

  def format_params
    params.require(:format).permit(:format)
  end
end
