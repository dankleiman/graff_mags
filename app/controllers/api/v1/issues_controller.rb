class Api::V1::IssuesController < ApplicationController
  respond_to :json

  def index
    respond_with Issue.all
  end
end
