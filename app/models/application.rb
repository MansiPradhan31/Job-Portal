class Application < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :status, presence: true
  validate :user_is_applicant, on: :create

  private

  def user_is_applicant
    unless user&.Applicant?
      errors.add(:user, "must be an applicant")
  end
end
