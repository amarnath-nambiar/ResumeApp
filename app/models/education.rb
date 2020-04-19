class Education < ApplicationRecord
  belongs_to :educateable, polymorphic: true
end
