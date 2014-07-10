class Admin::MagazinesController < ApplicationController
  def index
    @magazines = Magazine.all
  end

  def edit
    @magazine = Magazine.find(params[:id])
  end
end
