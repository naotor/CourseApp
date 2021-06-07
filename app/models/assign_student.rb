class AssignStudent < ApplicationRecord
  belongs_to :course
  belongs_to :studnet
end
