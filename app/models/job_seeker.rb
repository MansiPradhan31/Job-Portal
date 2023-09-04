class JobSeeker < User
  has_one :profile
  has_many :applications

end