class Api::V1::FacilitiesController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :set_facility, only: :show

  def index
    @facilities = Facility.all
  end

  def show 
    @user_favorite = current_user.favorites.find_by(facility_id: @facility.id)
  end

  def set_facility
    @facility = Facility.find(params[:id])
  end
end