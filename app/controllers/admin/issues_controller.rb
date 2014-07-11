class Admin::IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def edit
    @issue = Issue.find(params[:id])
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
end
