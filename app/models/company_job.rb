class CompanyJob < ApplicationRecord
  belongs_to :country
  belongs_to :company
  belongs_to :sale_employee, class_name: :User
  belongs_to :interview_employee, class_name: :User
  belongs_to :payment_employee, class_name: :User
end
