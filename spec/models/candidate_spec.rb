require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it { should belong_to :country }
end
