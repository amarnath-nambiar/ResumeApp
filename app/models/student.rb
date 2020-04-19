class Student < User
  has_many :educations, as: :educateable
  has_many :academic_projects
end
