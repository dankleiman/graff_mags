class Admin::IssuesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @issues = Issue.all
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  private

  def authenticate_admin!
    unless current_user.role == 'admin'
      flash[:alert] = 'You are not authorized to view this page.'
      redirect_to root_url
    end
  end
end
