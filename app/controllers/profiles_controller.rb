class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  def show
    render json: @profile
  end

  def create
    @profile = Profile.new(user_params)
    if @profile.save
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def update
    if @profile.update(user_params)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @profile.destroy
    render json: @profile, status: :ok
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
    render json: @profile.errors, status: 404 if @profile.nil? 
  end
    
  def user_params
    params.permit(:bio, :skills, :experience)
  end
end
