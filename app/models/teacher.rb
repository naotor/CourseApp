class Teacher < ApplicationRecord
  belongs_to :gender, optional: true
end
