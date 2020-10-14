class Document < ApplicationRecord
  belongs_to :documentable, polymorphic: true
  belongs_to :document_type
end
