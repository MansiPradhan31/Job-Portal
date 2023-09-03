class JobRecruitersController < ApplicationController
    def show
      @job_recruiter = JobRecruiter.find(params[:id])
    end
  
    def edit
      @job_recruiter = JobRecruiter.find(params[:id])
    end
  
    def update
      # Your job recruiter update logic here
    end
  
    def destroy
      # Your job recruiter deletion logic here
    end
  
    def view_created_jobs
      # View created jobs logic here
    end
  
    def view_applications
      # View job applications logic here
    end
  
    def accept_application
      # Accept job application logic here
    end
  
    def reject_application
      # Reject job application logic here
    end
  
    def view_approved_applications
      # View approved job applications logic here
    end
  
    def view_rejected_applications
      # View rejected job applications logic here
    end
  end
  