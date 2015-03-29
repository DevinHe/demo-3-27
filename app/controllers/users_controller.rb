class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def update_minutes
    @user = current_user
    if params[:minutes]
      temp = params[:minutes].to_i
      if temp > @user.sign_in_minutes
        @user.sign_in_minutes = params[:minutes].to_i
        @user.save!
      end
    end
    respond_to do |format|
      format.json { render json: @user, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
