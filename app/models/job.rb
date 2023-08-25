class Job < ApplicationRecord
  belongs_to :user
  has_many :applications

  validates :job_title, :job_description, :location, :salary, presenc: true
  validate :user_is_recruiter, on: :create

  private

  def user_is_recruiter
    unless user&.Recruiter?
      errors.add(:user, "must be a recruiter")
  end
end