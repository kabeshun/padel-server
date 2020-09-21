class Api::V1::UsersController < Api::ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all
  end

  def show 
  end

  def me
    @user = current_user
    render :show
  end

  def set_user
    @user = User.find(params[:id])
  end
end