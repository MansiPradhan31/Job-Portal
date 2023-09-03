class JobSeekersController < ApplicationController
    def show
      @job_seeker = JobSeeker.find(params[:id])
    end
  
    def edit
      @job_seeker = JobSeeker.find(params[:id])
    end
  
    def update
      # Your job seeker update logic here
    end
  
    def destroy
      # Your job seeker deletion logic here
    end
  
    def view_applications
      # View job applications logic here
    end
end
  