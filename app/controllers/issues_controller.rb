class IssuesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create, :update]

  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      flash[:notice] = "Successfully added issue."
      redirect_to issue_path(@issue.id)
    else
      flash[:notice] = "Could not add issue."
      render :new
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def update
    issue = Issue.find(params[:id])
    issue.update_attributes(issue_params)
    if issue.save
      flash[:notice] = "Successfully updated."
      redirect_to issue_path(issue.id)
    else
      flash[:notice] = "Could not update issue."
      render :new
    end
  end

  private

  def issue_params
    params.require(:issue).permit(
      :magazine_id,
      :title,
      :year,
      :front_cover,
      :back_cover,
      :featured_image,
      :address,
      :city,
      :state,
      :country,
      :subtitle,
      :issue_number,
      :language_id,
      :size_id,
      :stitching_id,
      :format_id,
      :medium_id,
      :crew_id)
  end
end
