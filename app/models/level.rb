class Level < ApplicationRecord
  belongs_to :course, optional: true
end
