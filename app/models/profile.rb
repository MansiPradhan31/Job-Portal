class Profile < ApplicationRecord
  belongs_to :user

  validates :bio, :skills, :experience, presence: true
end
