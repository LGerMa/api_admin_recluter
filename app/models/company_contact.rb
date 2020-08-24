class CompanyContact < ApplicationRecord
  belongs_to :contactable, polymorphic: true
end
