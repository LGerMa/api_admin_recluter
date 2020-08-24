require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should belong_to :country }
  it { should have_many :company_jobs }
end
