class Student < ApplicationRecord
  belongs_to :gender, optional: true
end
