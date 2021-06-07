class Course < ApplicationRecord
  belongs_to :teacher, optional: true
  belongs_to :level, optional: true

  has_many :assoc_genres, dependent: :destroy
  has_many :genres, through: :assoc_genres

  has_many :plans, dependent: :destroy
end
