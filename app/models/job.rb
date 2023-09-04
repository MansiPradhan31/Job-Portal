class Job < ApplicationRecord
  belongs_to :user
  has_many :applications

  validates :job_title, :job_description, :location, :salary, presence: true
  validate :user_is_recruiter, on: :create

  def user_is_recruiter
    unless user&.job_recruiter?
      errors.add(:base, "Only job recruiters can create jobs.")
    end
  end

end