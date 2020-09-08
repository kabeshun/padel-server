class Admin::HomeController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def show 
  end
end