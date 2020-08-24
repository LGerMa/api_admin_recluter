require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { should belong_to :phoneable }
end
