require 'rails_helper'

RSpec.describe CompanyJob, type: :model do
  it { should belong_to :country }
  it { should belong_to :company }
  it { should belong_to :sale_employee }
  it { should belong_to :interview_employee }
  it { should belong_to :payment_employee }
end
