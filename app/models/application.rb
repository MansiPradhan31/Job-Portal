class Application < ApplicationRecord
  belongs_to :job
  belongs_to :user

  enum status: [:applied, :accepted, :rejected]
  validate :user_is_seeker, on: :create

  def user_is_seeker
    unless user&.job_seeker?
      errors.add(:base, "Only job seeker can applied for job.")
    end
  end
end
