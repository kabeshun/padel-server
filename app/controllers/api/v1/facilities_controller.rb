class Api::V1::FacilitiesController < Api::ApplicationController
  def index
    @facilities = Facility.all
  end
end