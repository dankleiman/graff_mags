class Admin::IssuesController < ApplicationController
  autocomplete :magazine, :title

  def index
    @issues = Issue.all
  end

  def new
    @issue = Issue.new
  end

  def create
    issue = Issue.new(issue_params)
    if issue.save
      flash[:notice] = "Successfully added issue."
      redirect_to admin_issue_path(issue.id)
    else
      flash[:notice] = "Could not add issue."
      render :new
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    issue = Issue.find(params[:id])
    issue.update_attributes(issue_params)
    if issue.save
      flash[:notice] = "Successfully updated."
      redirect_to admin_issue_path(issue.id)
    else
      flash[:notice] = "Could not update issue."
      render :new
    end
  end

  def destroy
    issue = Issue.find(params[:id])
    if issue.destroy
      flash[:notice] = "Successfully deleted."
    else
      flash[:notice] = "Could not delete."
    end
    redirect_to admin_issues_path
  end

  private

  def issue_params
    params.require(:issue).permit(
      :magazine_title,
      :title,
      :year,
      :front_cover,
      :back_cover,
      :featured_image,
      :address,
      :city,
      :state,
      :country_id,
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
