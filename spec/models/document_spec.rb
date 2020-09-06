require 'rails_helper'

RSpec.describe Document, type: :model do
  it { should belong_to :documentable }
  it { should belong_to :document_type }
end
