class Course < ApplicationRecord
  belongs_to :teacher, optional: true
  belongs_to :level, optional: true

  has_many :assign_genres, dependent: :destroy
  has_many :genres, through: :assign_genres

  has_many :plans, dependent: :destroy
end
