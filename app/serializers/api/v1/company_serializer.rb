class Api::V1::CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :additional_info,
              :status, :company_code, :economic_solvency
  belongs_to :country
  has_many :company_contacts
  has_many :company_jobs
end
