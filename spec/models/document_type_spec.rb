require 'rails_helper'

RSpec.describe DocumentType, type: :model do
  it { should have_many :documents }
end
