class Admin::IssuesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @issues = Issue.all
  end

  def edit
    @issue = Issue.find(params[:id])
  end
end
