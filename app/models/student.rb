class Student < ApplicationRecord
  attribute :assign, type: :boolean
  belongs_to :gender, optional: true
end
