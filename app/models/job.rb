class Job < ApplicationRecord
  belongs_to :user
  has_many :applications

  validates :job_title, :job_description, :location, :salary, presenc: true
  validate :user_is_recruiter, on: :create

end