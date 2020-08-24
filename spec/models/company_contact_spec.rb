require 'rails_helper'

RSpec.describe CompanyContact, type: :model do
  it { should belong_to :contactable }
end
