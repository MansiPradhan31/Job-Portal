class JobSeekersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def show
    render json: @job_seeker
  end

  def update
    if @job_seeker.update(user_params)
      render json: @job_seeker
    else
      render json: @job_seeker.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job_seeker.destroy
    render json: @job_seeker, status: :ok
  end

  def view_jobs
    @job = Job.all
    render json: @job
  end
  
  def view_applications
    @job_seeker.applications
    render json: @job_seeker
  end

  private

  def set_user
    @job_seeker = JobSeeker.find_by(id: params[:id])
    unless @job_seeker
      render json: {error: 'Not found'}, status: :not_found
    end 
  end

  def user_params
    params.permit(:username,:email, :password, :type)
  end
end
  