class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action 
  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render  json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    render json: @user, status: :ok
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      render json: {error: 'User not found'}, status: :not_found
    end 
  end

  def user_params
    params.permit(:username,:email, :password, :type)
  end
end
