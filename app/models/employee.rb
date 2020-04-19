class Employee < User
  has_many :works
  has_many :educations, as: :educateable
end
