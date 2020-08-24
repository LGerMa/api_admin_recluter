require 'rails_helper'

RSpec.describe Country, type: :model do
  it { should have_many :users }
  it { should have_many :banks }
  it { should have_many :companies }
  it { should have_many :company_jobs }
  it { should have_many :candidates }
  it { should have_many :work_experiences }
end
