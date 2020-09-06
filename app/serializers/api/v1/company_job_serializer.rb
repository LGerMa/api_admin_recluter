class Api::V1::CompanyJobSerializer < ActiveModel::Serializer
  attributes :id, :company_job_code, :job_detail, :monthly_amount,
             :debt_amount, :contract_date, :job_status, :additional_info,
             :qty_vacancy

  belongs_to :country
  belongs_to :company
  has_many :job_vacancies
end
