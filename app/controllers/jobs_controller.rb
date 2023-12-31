class JobsController < ApplicationController
  before_action :set_job, only: [:show, :update, :destroy]

  def index
    @job = Job.all
    render json: @job
  end

  def show
    render json: @job
  end

  def create
    @job = Job.new(user_params)
    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(user_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    render json: @job, status: :ok
  end

  private

  def set_job
    @job = Job.find_by(id: params[:id])
    unless @job
      render json: {error: 'Job not found'}, status: :not_found
    end 
  end
    
  def user_params
    params.permit(:user_id, :job_title, :job_description, :location, :salary)
  end
end
