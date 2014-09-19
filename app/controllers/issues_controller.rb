class IssuesController < ApplicationController

  def index
    @issues = Issue.where("featured_image IS NOT NULL")
    row_count = @issues.size/6
    @issues = @issues.first(row_count*6)
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
