class Api::V1::JobVacancySerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :status
  belongs_to :company_job
  belongs_to :candidate
  belongs_to :sale_employee
  belongs_to :interview_employee
  belongs_to :payment_employee
end
