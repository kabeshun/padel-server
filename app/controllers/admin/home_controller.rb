class Admin::HomeController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @facilities = Facility.all
  end

  def show 
  end
end