require 'rails_helper'

RSpec.describe Bank, type: :model do
  it { should belong_to :country }
  it { should have_many :user_banks }
end
