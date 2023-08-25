class User < ApplicationRecord
  has_one :profile
  has_many :jobs
  has_many :applications

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "is not a valid email"}
  validates :password, presence: true, length: { in: 6..20 }
  validates :role, presence: true, inclusion: {in: ['Recruiter', 'Applicant'], message: "is invalid"}

end
