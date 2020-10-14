require 'rails_helper'

RSpec.describe CompanyJob, type: :model do
  it { should belong_to :country }
  it { should belong_to :company }
  it { should have_many :job_vacancies }
end
