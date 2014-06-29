class IssuesController < ApplicationController
  def index
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue=Issue.new(issue_params)
       if @issue.save
      flash[:notice] = "Successfully added issue."
      redirect_to issue_path(@issue.id)
    else
      flash[:notice] = "Could not add issue."
      render :new
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end


  private

  def issue_params
    params.require(:issue).permit(:magazine, :title, :year, :cover, :address, :city, :state, :country)
  end
end
