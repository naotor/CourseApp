class AssignGenre < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :genre, optional: true
end
