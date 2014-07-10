class Admin::SizesController < ApplicationController
  def index
    @sizes = Size.all
  end

  def new
    @size = Size.new
  end

  def create
    @size = Size.new(size_params)
      if @size.save
      flash[:notice] = "Successfully added size."
      redirect_to admin_size_path(@size.id)
    else
      flash[:notice] = "Could not add size."
      render :new
    end
  end

  def show
    @size = Size.find(params[:id])
  end

  def edit
    @size = Size.find(params[:id])
  end

  def update
    size = Size.find(params[:id])
    size.update_attributes(size_params)
      if size.save
      flash[:notice] = "Successfully update size."
      redirect_to admin_size_path(size.id)
    else
      flash[:notice] = "Could not update size."
      render :new
    end
  end

  private

  def size_params
    params.require(:size).permit(:size)
  end
end
