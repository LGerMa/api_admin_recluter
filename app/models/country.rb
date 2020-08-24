class Country < ApplicationRecord
  has_many :users
  has_many :banks
  has_many :companies
  has_many :company_jobs
  has_many :candidates
  has_many :work_experiences
end
