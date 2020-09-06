class JobVacancy < ApplicationRecord

  belongs_to :candidate, optional: true
  belongs_to :company_job
  belongs_to :sale_employee, class_name: :User, optional: true
  belongs_to :interview_employee, class_name: :User, optional: true
  belongs_to :payment_employee, class_name: :User, optional: true
end
