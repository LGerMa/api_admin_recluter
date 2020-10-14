require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it { should belong_to :country }
  it { should have_many :phones}
  it { should have_many :documents}
  it { should have_many :work_experiences}
end
