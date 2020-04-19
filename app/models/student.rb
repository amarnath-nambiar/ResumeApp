class Student < User
  has_many :educations, as: :educateable
end
