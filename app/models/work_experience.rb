class WorkExperience < ApplicationRecord
  belongs_to :country
  belongs_to :workable, polymorphic: true
end
