require 'rails_helper'

RSpec.describe JobVacancy, type: :model do
  it { should belong_to(:candidate).optional }
  it { should belong_to :company_job }
  it { should belong_to(:sale_employee).optional }
  it { should belong_to(:interview_employee).optional }
  it { should belong_to(:payment_employee).optional }
end
