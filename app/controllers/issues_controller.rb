class IssuesController < ApplicationController
  def index
  end

  def new
    @issue = Issue.new
  end

  def create
  end

  def show
    @issue = Issue.find(params[:id])
  end
end
