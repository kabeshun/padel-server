class Api::V1::FacilitiesController < Api::ApplicationController
  before_action :set_facility, only: :show

  def index
    @facilities = Facility.all
  end

  def show 
  end

  def set_facility
    @facility = Facility.find(params[:id])
  end
end