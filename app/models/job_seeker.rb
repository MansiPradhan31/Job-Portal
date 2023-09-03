class JobSeeker < User
    # Additional attributes and methods specific to job seekers
  has_one :profile
end