require 'rails_helper'

RSpec.describe UserBank, type: :model do
  it { should belong_to :user }
  it { should belong_to :bank }
end
