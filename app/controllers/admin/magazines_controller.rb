class Admin::MagazinesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @magazines = Magazine.all
  end

  def edit
    @magazine = Magazine.find(params[:id])
  end
end
