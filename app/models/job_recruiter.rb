class JobRecruiter < User
  has_one :profile
  has_many :jobs

end
  