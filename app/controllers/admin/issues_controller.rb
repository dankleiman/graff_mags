class Admin::IssuesController < ApplicationController
  def index
    @issues = Issue.all
  end

  def edit
    @issue = Issue.find(params[:id])
  end
end
