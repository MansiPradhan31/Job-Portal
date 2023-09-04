class JobRecruitersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :view_created_jobs]

  def show
    render json: @job_recruiter
  end

  def update
    if @job_recruiter.update(user_params)
      render json: @job_recruiter
    else
      render json: @job_recruiter.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @job_recruiter.destroy
    render json: @job_recruiter, status: :ok
  end

  def view_created_jobs
    @job_recruiter = Job.where(id: params[:user_id])
    render json: @job_recruiter, status: :ok
  end

  def view_applications
  end

  def accept_application
  end

  def reject_application
  end

  def view_approved_applications
  end

  def view_rejected_applications
  end

  private

  def set_user
    @job_recruiter = JobRecruiter.find_by(id: params[:id])
    unless @job_recruiter
      render json: {error: 'Not found'}, status: :not_found
    end 
  end

  def user_params
    params.permit(:username,:email, :password, :type)
  end
end
  