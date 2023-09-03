class Application < ApplicationRecord
  belongs_to :job
  belongs_to :user

  validates :status, presence: true
  validate :user_is_applicant, on: :create

end
