class User < ApplicationRecord
  has_one :profile
  has_many :jobs
  has_many :applications
  self.inheritance_column = :_type_disabled

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "is not a valid email"}
  validates :password, presence: true, length: { in: 6..20 }
  validates :type, presence: true, inclusion: {in: ['JobSeeker', 'JobRecruiter'], message: "is invalid"}  
end
