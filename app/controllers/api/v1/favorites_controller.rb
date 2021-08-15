class Api::V1::FavoritesController < Api::ApplicationController
  before_action :set_user, only: :show

  def set_favorite
    if current_user.favorites.find_by(facility_id: params[:facility_id]).present?
      current_user.favorites.find_by(facility_id: params[:facility_id]).update!(is_favorite: true)
    else 
      favorite = current_user.favorites.create(facility_id:  params[:facility_id], is_favorite: true)
      favorite.save!
    end

    
    render json: { success: 1 }, status: :created
  end

  def remove_favorite
    favorite = current_user.favorites.find_by(facility_id: 1) 
    favorite.update!(is_favorite: false)
    render json: { success: 1 }, status: :ok
  end

  def set_user
    @user = User.find(params[:id])
    @user = current_user
  end
end