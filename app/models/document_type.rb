class DocumentType < ApplicationRecord
  has_many :documents

  enum status: {active: 0, inactive: 1}
end
