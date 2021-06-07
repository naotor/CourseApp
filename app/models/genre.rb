class Genre < ApplicationRecord
  belongs_to :course, optional: true
end
