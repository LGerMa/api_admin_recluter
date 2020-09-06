require 'rails_helper'

RSpec.describe JobVacancy, type: :model do
  it { should belong_to :candidate }
  it { should belong_to :company_job }
  it { should belong_to :sale_employee }
  it { should belong_to :interview_employee }
  it { should belong_to :payment_employee }
end
