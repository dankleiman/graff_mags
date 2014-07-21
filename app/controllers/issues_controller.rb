class IssuesController < ApplicationController

  def index
    row_count = Issue.count/6
    @issues = Issue.where("featured_image IS NOT NULL").limit(row_count*6)
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
