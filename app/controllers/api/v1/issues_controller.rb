class Api::V1::IssuesController < ApplicationController
  respond_to :json

  def index
    respond_with Issue.all
  end

  def show
    respond_with issue
  end

  private

  def issue
    Issue.find(params[:id])
  end
end
