require 'rails_helper'

RSpec.describe WorkExperience, type: :model do
  it { should belong_to :country }
  it { should belong_to :workable }
end
