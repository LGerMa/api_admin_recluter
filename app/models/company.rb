class Company < ApplicationRecord
  belongs_to :country
  has_many :company_jobs
end
