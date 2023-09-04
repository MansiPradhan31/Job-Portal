class ApplicationsController < ApplicationController
  before_action :set_user, only: [:create, :update, :destroy]

  def create
    @app = Application.new(app_params)
    if @app.save
      render  json: @app, status: :created
    else
      render json: @app.errors, status: :unprocessable_entity
    end
  end

  def update
    if @app.update(app_params)
      render json: @app
    else
      render json: @app.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @app.destroy
    render json: @app, status: :ok
  end

  private

  def set_user
    @app = Application.find_by(id: params[:id])
    unless @app
      render json: {error: 'Application not found'}, status: :not_found
    end 
  end
  
  def app_params
    params.permit(:job_id, :user_id)
  end
end
  