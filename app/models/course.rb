class Course < ApplicationRecord
  belongs_to :teacher, optional: true
  belongs_to :genre, optional: true
  belongs_to :level, optional: true
end
