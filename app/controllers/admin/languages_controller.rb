class Admin::LanguagesController < ApplicationController
  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
      if @language.save
      flash[:notice] = "Successfully added language."
      redirect_to admin_language_path(@language.id)
    else
      flash[:notice] = "Could not add language."
      render :new
    end
  end

  def show
    @language = Language.find(params[:id])
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    language = Language.find(params[:id])
    language.update_attributes(language_params)
      if language.save
      flash[:notice] = "Successfully update language."
      redirect_to admin_language_path(language.id)
    else
      flash[:notice] = "Could not update language."
      render :new
    end
  end

  def destroy
    language = Language.find(params[:id])
    if language.destroy
      flash[:notice] = "Successfully deleted."
    else
      flash[:notice] = "Could not delete."
    end
    redirect_to admin_languages_path
  end

  private

  def language_params
    params.require(:language).permit(:language)
  end
end
