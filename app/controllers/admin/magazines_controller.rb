class Admin::MagazinesController < ApplicationController
  def index
    @magazines = Magazine.all
  end

  def edit
    @magazine = Magazine.find(params[:id])
  end

  def destroy
    magazine = Magazine.find(params[:id])
    if magazine.destroy
      flash[:notice] = "Successfully deleted."
    else
      flash[:notice] = "Could not delete."
    end
    redirect_to admin_magazines_path
  end
end
