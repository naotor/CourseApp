class AssignStudent < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :studnet, optional: true
end
